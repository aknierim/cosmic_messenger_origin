[![DOI](https://zenodo.org/badge/812022899.svg)](https://zenodo.org/doi/10.5281/zenodo.11580793)

# Cosmic Messenger Origin

Minimalistic graphic showing the origin of various cosmic messengers.

![Cosmic messengers on their way to Earth.](./cm_overview.png "Cosmic Messengers")

## Usage
In the root directory, call
```
$ make [all,build/cm_overview.pdf,build/cm_overview_accelerator.pdf]
```
to build the graphic. An installation of TeXLive is required.

> [!IMPORTANT]
> 1. Due to the way TikZ handles shadings, some PDF viewers do not display the shadings and color gradients
> in this graphic. The same applies for printers. To circumvent this, please convert the PDFs to PNGs
> using the `convert_png` target of the Makefile. Per default this will create PNGs with a DPI value of 600.
> For higher resolutions change the value accordingly.
> 2. If you get an error message like
> ```bash
> convert: attempt to perform an operation not allowed by the security policy `PDF'
> ```
> please change the line
> ```xml
> <policy domain="coder" rights="none" pattern="PDF" />
> ```
> to
> ```xml
> <policy domain="coder" rights="read | write" pattern="PDF" />
> ```
> inside the file `/etc/ImageMagick-7/policy.xml`. This should fix the issue and allow the PDF to be converted.

## Citation
If you want to include this graphic in a project or scientific work, refer to the Zenodo DOI above or cite it as follows:
```
@software{Knierim_Cosmic_Messengers_2024,
  author       = {Knierim, Anno},
  title        = {Cosmic Messengers},
  month        = aug,
  year         = 2024,
  publisher    = {Zenodo},
  version      = {v3.0},
  doi          = {10.5281/zenodo.13492862},
  url          = {https://doi.org/10.5281/zenodo.13492862}
}
```
