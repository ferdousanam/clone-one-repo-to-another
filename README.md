## Usage

Executing clone one repository to another repository using credentials

```yaml
name: clone one repository to another repository
on: [ push ]

jobs:
  build:
  name: Clone
  runs-on: ubuntu-latest

  steps:
    - name: executing clone one repository to another repository
      uses: ferdousanam/clone-one-repo-to-another@master
      with:
        SRC_REPO_HOST: ${{ secrets.SRC_REPO_HOST }}
        SRC_REPO_ORGANIZATION: ${{ secrets.SRC_REPO_ORGANIZATION }}
        SRC_REPO_NAME: ${{ secrets.SRC_REPO_NAME }}
        SRC_REPO_USERNAME: ${{ secrets.SRC_REPO_USERNAME }}
        SRC_REPO_PASSWORD: ${{ secrets.SRC_REPO_PASSWORD }}

        DEST_REPO_HOST: ${{ secrets.DEST_REPO_HOST }}
        DEST_REPO_ORGANIZATION: ${{ secrets.DEST_REPO_ORGANIZATION }}
        DEST_REPO_NAME: ${{ secrets.DEST_REPO_NAME }}
        DEST_REPO_USERNAME: ${{ secrets.DEST_REPO_USERNAME }}
        DEST_REPO_PASSWORD: ${{ secrets.DEST_REPO_PASSWORD }}
```