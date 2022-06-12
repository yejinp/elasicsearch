
# coding=utf-8
from __future__ import unicode_literals

import logging
import os
import re
import time
import sys

try:
    from urllib.parse import urlparse  # py3
except:
    from urlparse import urlparse  # py2

import pdfkit
import requests
from bs4 import BeautifulSoup

html_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
{content}
</body>
</html>

"""


class Crawler(object):
    """
    爬虫基类，所有爬虫都应该继承此类
    """
    name = None

    def __init__(self, name, start_url):
        """
        初始化
        :param name: 将要被保存为PDF的文件名称
        :param start_url: 爬虫入口URL
        """
        self.name = name
        self.start_url = start_url
        uri = urlparse(self.start_url)
        self.domain = '{0}://{1}{2}'.format(uri.scheme, uri.netloc, os.path.dirname(uri.path))

    @staticmethod
    def request(url, **kwargs):
        """
        网络请求,返回response对象
        :return:
        """
        response = requests.get(url, **kwargs)
        #print("url:[%s], response:[%s]"%(url,response))
        return response

    def parse_menu(self, response):
        """
        从response中解析出所有目录的URL链接
        """
        raise NotImplementedError

    def parse_body(self, response):
        """
        解析正文,由子类实现
        :param response: 爬虫返回的response对象
        :return: 返回经过处理的html正文文本
        """
        raise NotImplementedError

    def run(self):
        start = time.time()
        options = {
            'page-size': 'Letter',
            'margin-top': '0.75in',
            'margin-right': '0.75in',
            'margin-bottom': '0.75in',
            'margin-left': '0.75in',
            'encoding': "UTF-8",
            'custom-header': [
                ('Accept-Encoding', 'gzip')
            ],
            'cookie': [
                ('cookie-name1', 'cookie-value1'),
                ('cookie-name2', 'cookie-value2'),
            ],
            'outline-depth': 10,
        }
        htmls = []
        print("get html files")
        fail_count = 0
        for index, url in enumerate(self.parse_menu(self.request(self.start_url))):
            print(url)
            #html = self.parse_body(self.request(url))
            uri = urlparse(url)
            if os.path.exists(os.path.basename(uri.path)):
                print("downloaded, skip")
                continue
            try:
                html = self.request(url).content
            except Exception as e:
                time.sleep(5)
                fail_count = fail_count + 1
                print(e)
                continue
            with open(os.path.basename(uri.path) , 'wb') as f:
                f.write(html)
            
            #f_name = ".".join([str(index), "html"])
            #with open(f_name, 'wb') as f:
            #    f.write(html)
            #htmls.append(f_name)
        print("try to convert files to pdf: %d" % len(htmls))
        try:
            pass
            #pdfkit.from_file(htmls, self.name + ".pdf", options=options)
        except Exception as e:
            print("get ", e)
        #for html in htmls:
        #    os.remove(html)
        total_time = time.time() - start
        print(u"总共耗时：%f 秒" % total_time)
        sys.exit(fail_count)


class LiaoxuefengPythonCrawler(Crawler):
    """
    廖雪峰Python3教程
    """

    def parse_menu(self, response):
        """
        解析目录结构,获取所有URL目录列表
        :param response 爬虫返回的response对象
        :return: url生成器
        """
        #print(response.content)
        soup = BeautifulSoup(response.content, "html.parser")
        menu_tag = soup.find_all(class_="uk-nav uk-nav-side")[1]
        
        #print(menu_tag.find_all("div"))
        for li in menu_tag.find_all("div"):

            url = li.a.get("href")
            if not url.startswith("http"):
                url = "".join([self.domain, url])  # 补全为全路径
            yield url

    def parse_body(self, response):
        print(response)
        """
        解析正文
        :param response: 爬虫返回的response对象
        :return: 返回处理后的html文本
        """
        try:
            soup = BeautifulSoup(response.content, 'html.parser')
            body = soup.find_all(class_="x-wiki-content")[0]

            # 加入标题, 居中显示
            title = soup.find('h4').get_text()
            center_tag = soup.new_tag("center")
            title_tag = soup.new_tag('h1')
            title_tag.string = title
            center_tag.insert(1, title_tag)
            body.insert(1, center_tag)

            html = str(body)
            # body中的img标签的src相对路径的改成绝对路径
            pattern = "(<img .*?src=\")(.*?)(\")"

            def func(m):
                if not m.group(2).startswith("http"):
                    rtn = "".join([m.group(1), self.domain, m.group(2), m.group(3)])
                    return rtn
                else:
                    return "".join([m.group(1), m.group(2), m.group(3)])

            html = re.compile(pattern).sub(func, html)
            html = html_template.format(content=html)
            html = html.encode("utf-8")
            return html
        except Exception as e:
            logging.error("解析错误", exc_info=True)


class ES_PythonCrawler(Crawler):
    """
    elasticsearch reference 6.0
    """

    def parse_menu(self, response):
        """
        解析目录结构,获取所有URL目录列表
        :param response 爬虫返回的response对象
        :return: url生成器
        """
        #print(response.content)
        soup = BeautifulSoup(response.content, "html.parser")
        #menu_tag = soup.find_all(class_="book")
        menu_tag = soup.find_all(class_="toc")[1]
        
        #print(menu_tag)
        #with open("menu_tag.html", 'w') as wf:
        #    wf.write(menu_tag)
        for li in menu_tag.find_all("li")[1:]:
            url = li.a.get("href")
            if not url.startswith("https"):
                url = "/".join([self.domain, url])  # 补全为全路径
            #print(url)
            yield url

    def parse_body(self, response):
        """
        解析正文
        :param response: 爬虫返回的response对象
        :return: 返回处理后的html文本
        """
        try:
            #print(response.content)
            soup = BeautifulSoup(response.content, 'html.parser')
            #body = soup.find_all(class_="x-wiki-content")[0]
            body = soup.find_all(class_="part")[3]

            # 加入标题, 居中显示
            #title = soup.find('h1').get_text()
            #title = body.find('title').get_text()
            center_tag = soup.new_tag("center")
            title_tag = soup.new_tag('h1')
            title_tag.string = "ttt"
            center_tag.insert(1, title_tag)
            body.insert(1, center_tag)

            html = str(body)
            # body中的img标签的src相对路径的改成绝对路径
            pattern = "(<img .*?src=\")(.*?)(\")"

            def func(m):
                if not m.group(2).startswith("https"):
                    rtn = "".join([m.group(1), self.domain, m.group(2), m.group(3)])
                    return rtn
                else:
                    return "".join([m.group(1), m.group(2), m.group(3)])

            #html = re.compile(pattern).sub(func, html)
            html = html_template.format(content=html)
            html = html.encode("utf-8")
            return html
        except Exception as e:
            logging.error("解析错误", exc_info=True)


if __name__ == '__main__':
    start_url = "https://www.elastic.co/guide/en/elasticsearch/reference/6.0/index.html"
    crawler = ES_PythonCrawler("ES6.0.0", start_url)
    crawler.run()
