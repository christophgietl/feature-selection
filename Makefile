help:	## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

edit_slides:	## Start JupyterLab
	jupyter lab

export_and_present_slides:	## Use NbConvert to export slides as Reveal.js slideshow
	jupyter nbconvert feature-selection.ipynb --to slides --post serve

set_up_python_environment:	## Install Python dependencies needed to edit and run this presentation
	pip3 install --requirement requirements.txt
