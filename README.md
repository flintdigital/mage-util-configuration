## Magerun Magento Utility for updating magento config
Magento utility used for migrating magento settings between dev instances. Requires magerun and the Harris Street Import/Export module. 

### Installation
Make sure that the required dpendancies are installed (see below). 
Use wget from the magento root:
```shell
wget https://github.com/flintdigital/mage-util-configuration/archive/master.zip
unzip master
mv mage-util-configuration-master/configuration .
rm -Rf mage-util-configuration-master
```

### Dependancies

#### Magerun (n98-magerun)
Magerun is required in both the local an the server environment. 
You can install magerun locally using this gist: https://gist.github.com/nflint/4308cd456c73f10101b0
Magerun Github Repo: https://github.com/netz98/n98-magerun

#### Harris Street 
This is a magerun module that needs to be installed in any magento instance that you want to use it. 

*Installing Harris Street*

```shell
#CD into root magento installation. 
cd $HOME/Sites/mysite
# Add the module using modgit from the GH repo. 
modgit add magerun-harris-street-mod git@github.com:Zookal/HarrisStreet-ImpEx.git
```

Harris Street GitHub Repo: https://github.com/Zookal/HarrisStreet-ImpEx
See this blog post for additional instructions: http://magerun.net/harrisstreet-impex-for-magento/

### Instructions
First you will need to run the init.sh in the configuration folder. You may also want to change the name of  init.sh. 

```shell
cd configuration
sh init.sh
mv init.sh init.sh.bak
```
This is what the init looks like. 
```shell
cd base
magerun hs:ccd:export --filePerNameSpace=y --include=web --filename=base
cp base_web.yaml ../dev/dev_web.yaml
cp base_web.yaml ../prod/prod_web.yaml
cp base_web.yaml ../dev2/dev2_web.yaml
cp base_web.yaml ../local/nflint/nflint_web.yaml
cp base_web.yaml ../local/adrian/adrian_web.yaml
cp base_web.yaml ../archive/archive_web.yaml
```
This will create a copy of the install that you originally ran the script on in each directory. You will need to manually edit each of the YAML files to match the dev environments. Once this is done please commit this to the Magento install repo. 

To update the URL for a given environement you should you can run the corresponding import script (from the Magento root):
```shell
# For importing into local import files are dev-import-config.sh, prod-import-config.sh archive-import-config.sh
cd configuration
sh local-import-config.sh
```
