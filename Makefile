export JUPYTER_PATH=${PWD}/share/jupyter


help:	## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

edit_slides:	## Start JupyterLab
	jupyter lab

export_slides:	## Use NbConvert to export slides as Reveal.js slideshow
	jupyter nbconvert \
		--output index \
		--reveal-prefix reveal.js \
		--SlidesExporter.file_extension .html \
		--SlidesExporter.reveal_theme white \
		--template reveal-notes-and-slide-numbers \
		--to slides \
		feature-selection.ipynb

export_and_present_slides:	## Use NbConvert to export slides as Reveal.js slideshow and start the show
	jupyter nbconvert \
		--post serve \
		--output index \
		--reveal-prefix reveal.js \
		--SlidesExporter.file_extension .html \
		--SlidesExporter.reveal_theme white \
		--template reveal-notes-and-slide-numbers \
		--to slides \
		feature-selection.ipynb

set_up_python_environment:	## Install Python dependencies needed to edit and run this presentation
	pip3 install --requirement requirements.txt
