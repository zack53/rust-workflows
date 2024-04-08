# To be ran in application root directory of project
mkdir .github
mkdir .github/workflows

wget -O .github/workflows/build-tag.yml https://raw.githubusercontent.com/zack53/rust-workflows/main/.github/workflows/build-tag.yml
wget -O .github/workflows/ci-build-test.yml https://raw.githubusercontent.com/zack53/rust-workflows/main/.github/workflows/ci-build-test.yml
wget -O .github/workflows/release.yml https://raw.githubusercontent.com/zack53/rust-workflows/main/.github/workflows/release.yml