# Local Cache on Self-Hosted

## Cache dependencies and build outputs to improve workflow execution time on self hosted machine.

## Usage

```yml
build:
  name: Build
  runs-on: [self-hosted]
  steps:
    - name: Check out Git repository
      uses: actions/checkout@v3

    - name: Cache Pods
      uses: tamvo0610/local-cache@v1
      with:
        TARGET_PATH: 'ios/Podfile.lock'
        TARGET_ACTION: pod install
        CACHE_KEY: pods-${{ hashFiles('ios/Podfile.lock') }}
        CACHE_PATH: $HOME/actions-runner/_workdir/cache
```

## Inputs Variable

Set input variable in secrets of your repository as below:
| Input variable | Description | Example |
|--------------------------|-----------------------------------------------------|-----------------------|
| TARGET_PATH | File or folder to be cached | ios/Podfile.lock |
| TARGET_ACTION | Action will be run if cache not found | pod install |
| CACHE_KEY | Explicit key for versioning the cache | pods-${{ hashFiles('ios/Podfile.lock') }} |
| CACHE_PATH | Path dir will cache | actions_runnder/_workdir/cache |
