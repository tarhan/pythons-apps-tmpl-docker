## Description

This Docker image is simple base image for Python apps.  
It uses **app.yaml** manifest file located in child Docker image.  

**app.yaml** describe OS dependencies needed by Python packages during installation of Python packages enlisted inside standard **requirements.txt** file. It distincts build time and run time dependencies. So for example during Python package installation you will need to have header files for libraries and various compilers like **gcc**. But after installation is complete you will needed only libraries itself without headers and compilers which uses usually more then 200 MBytes.  
## Usage
Use one of following base images for your image.
```
tarhan/python-base:3.5.4 - for Python 3.5.4
tarhan/python-base:3.6.3 - for Python 3.6.3
```

Your child image must have at least two files **app.yaml** describing OS dependencies and **requirements.txt** describing Python dependencies.  
**requirements.txt** is standard file enlist packages which will be installed by **pip**.  

**app.yaml** structure must be similar to following:
```yaml
name: "test name"

dependencies:
  alpine:
    runtime:
      - openssl
      - libffi
      - libxml2
      - libxslt
    buildtime:
      - openssl-dev
      - libffi-dev
      - libxml2-dev
      - libxslt-dev
```
This example OS dependencies needed by Python package **Scrapy**. During child image building OS installs more than 200 MBytes of build time dependencies. After **Scrapy** building complete all build time dependencies will be removed. Remaining OS libraries will require only 4 MBytes instead of potential 200 MBytes.
