# To be ran in application root directory of project
wget -O Dockerfile https://raw.githubusercontent.com/zack53/rust-workflows/main/Dockerfile

projectName=$(toml get Cargo.toml package.name | sed 's/"//g')

sed -i -E 's/image-place-holder/'${projectName}'/g' Dockerfile