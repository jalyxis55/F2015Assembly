Cycsi - Single Cycle Virtual CPU
################################

COSC2325
********

Computer Architecture and Machine Language
==========================================

..  image:: https://travis-ci.org/rblack42/Cycsi.svg?branch=master

:Author: Roie R. Black
:Date: Sept 20, 2015
:Version: 0.1

This is an example machine developed to demonstrate aspects of modern processor
architecture. 

Installation
************

..  code-block:: text

    $ git clone https://rblack42/Cycsi.git
    $ cd Cycsi
    $ make 
    $ make test
    $ make run

Updates
*******

..  warning::

    I am using TravisCI to test this program. If you do not see a "build/passing" bdge on this page, do not update your copy. That means there are problems I am working on. Only update when things are in good shape!

You can update your local copy as needed by doing this:

..  code-block:: text

    $ cd Cycsi
    $ git pull

Building Docs
*************

This project includes documentation that will build if you have Sphinx
installed. I use a Python virtualenv setup to build these. If you have Python
pip, and virtualenv installed, you can do this:

..  code-block:: text

    $ cd Cycsi
    $ virtualenv _venv
    $ source _venv/bin/activate
    (_venv)$ pip install -r requirements.txt
    (_venv)$ make html

After this command set completes, your HTML documantation is available by
opening ``docs/html/index.html`` in your web browser.

