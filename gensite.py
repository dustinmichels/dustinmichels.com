"""
Jinja2 script for making website!
"""

import sys
import os
import shutil
from jinja2 import Environment, FileSystemLoader, Markup, select_autoescape
from bs4 import BeautifulSoup

IN_DIR = './templates'
OUT_DIR = '_build'

env = Environment(
    loader=FileSystemLoader(IN_DIR),
    autoescape=select_autoescape(['html', 'xml'])
)

if __name__ == '__main__':

    # make build dir
    if os.path.exists(OUT_DIR):
        shutil.rmtree(OUT_DIR)
    os.makedirs(OUT_DIR)

    # copy assets, scripts, styles into build dir
    shutil.copytree('assets', '_build/assets')
    shutil.copytree('scripts', '_build/scripts')
    shutil.copytree('styles', '_build/styles')

    # render each page in IN_DIR to OUT_DIR
    pages = [p for p in os.listdir(IN_DIR) if p != 'base.html']
    for page in pages:
        template = env.get_template(page)
        template.stream().dump(f'{OUT_DIR}/{page}')

        # html_doc = template.render()
        # soup = BeautifulSoup(html_doc, 'html.parser')
        # new_html = soup.prettify()

        # with open(f'{OUT_DIR}/{page}', 'w') as f:
        #     f.write(new_html)
