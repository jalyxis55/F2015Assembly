from fabric.api import *

env.hosts = ['www.co-pylit.org']

def build():
    local('sphinx-build -b html . _build/html')

def clean():
    local('rm -rf _build')
    local('rm -rf slides/_build/html')

def update(msg):
    local('git add .')
    local('git commit -m "%s"' % msg)
    local('git push origin master')

def slides():
    with lcd('slides'):
        local('sphinx-build -b html . _build/html')
        local('mkdir -p _build/html/Wslides')
        local('cp -R _build/html/ ../_build/html/Wslides/')

def sync():
    localdir = '_build/html/'
    remotedir = 'html/courses/cosc2325'
    local('rsync -arvuz %s %s@%s:%s' % (localdir, env.user, env.hosts[0], remotedir))
