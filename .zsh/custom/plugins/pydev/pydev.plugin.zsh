function pyve() {
  pyenv virtualenv $@
}

function act() {
  pyenv activate $1
}

function deact() {
  pyenv deactivate
}

alias pydev="pip3 install --upgrade jedi pylint pep8 ipdb pudb"
