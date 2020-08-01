# -*- coding: utf-8 -*-
#
import sys
import os
import shlex
import sphinx_bootstrap_theme

sys.path.insert(0, os.path.abspath('.'))

# -- General configuration ------------------------------------------------

extensions = []
templates_path = ['_templates']

source_suffix = '.rst'
master_doc = 'index'

# General information about the project.
project = u'C++ Examples'
copyright = u'2015, Roie R. Black'
author = u'Roie R. Black'

version = 'Fall.15.1'
release = '1.0'

language = None

today_fmt = '%B %d, %Y'
exclude_patterns = ['_venv', '_build', 'README.rst']
pygments_style = 'sphinx'

todo_include_todos = False


# -- Options for HTML output ----------------------------------------------

html_theme = 'bootstrap'
html_theme_path = sphinx_bootstrap_theme.get_html_theme_path()
html_theme_options = {
    'navbar_title' : 'C++ Examples',
    'navbar_site_name' : 'Links',
    'navbar_pagenav_name' : 'Page',
    'globaltoc_depth': 2,
    'navbar_class': "navbar",
    'navbar_fixed_top': "true",
    'navbar_sidebarrel': True,
    'source_link_position': "footer",
    'bootswatch_theme': "flatly",
    'bootstrap_version': "3",
}

html_sidebars = {
    'sidebar': ['localtoc.html', 'sourcelink.html', 'searchbox.html']
}

html_title = "C++ Examples"
#html_short_title = None
#html_logo = None
#html_favicon = '_static/images/favicon.ico'

html_static_path = ['_static']
html_last_updated_fmt = '%b %d, %Y'
#html_sidebars = {}
#html_use_index = True
html_show_sourcelink = True
html_show_sphinx = True
html_show_copyright = True

# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
'papersize': 'letterpaper',
'pointsize': '11pt',
#'preamble': '',
}

latex_documents = [
  (master_doc, 'CppExamples.tex', u'Cpp Examples',
   u'Roie R. Black', 'manual'),
]

#latex_logo = None
#latex_show_urls = False
#latex_appendices = []
#latex_domain_indices = True

