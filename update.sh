set -e

export PYTHONPATH
PYTHONPATH=/home/www-data/github_asset_downloader-master/

asset_url=$(python3.7 -m github_asset_downloader 2>/dev/null)

echo $asset_url

if stat asset.zip;
then rm asset.zip;
fi

wget $asset_url -O asset.zip

stat asset.zip

if stat asset_extracted/;
then rm rm -rf asset_extracted/;
fi

unzip asset.zip -d asset_extracted

stat asset_extracted/
stat asset_extracted/build/

stat /var/www/sim

if stat /var/www/sim-old/;
then rm -rf /var/www/sim-old/;
fi

mv /var/www/sim /var/www/sim-old

mv asset_extracted/build /var/www/sim

echo update successfull
