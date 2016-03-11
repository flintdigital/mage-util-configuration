#!bin/bash


cd base
magerun hs:ccd:export --filePerNameSpace=y --include=web --filename=base
cp base_web.yaml ../dev/dev_web.yaml
cp base_web.yaml ../prod/prod_web.yaml
cp base_web.yaml ../dev2/dev2_web.yaml
cp base_web.yaml ../local/nflint/nflint_web.yaml
cp base_web.yaml ../local/adrian/adrian_web.yaml
cp base_web.yaml ../local/default/default_web.yaml
cp base_web.yaml ../archive/archive_web.yaml
