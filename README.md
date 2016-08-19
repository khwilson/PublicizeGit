# Publicize Git

Often when you open source software, you have a private version that contains
perhaps more information than you want to share (or information that you
didn't mean to share), and a public version that lots of people can use.
These scripts provide one (jank) way of maintaining these separate
repositories.

Specifically, the strategy is:
  * Maintain a `clean` branch of the private repository which will be used to
    push to the public repository,
  * Squash the current state of `master` onto the `clean` branch, and
  * Push the `clean` branch to the public repository.

## Setup

You'll need to create two repos, which we will call `PrivateRepo` and
`PublicRepo`. Then you should run

```
git clone git@github.com:khwilson/PrivateRepo.git
cd PrivateRepo
setup_repo.sh git@github.com:khwilson/PublicRepo.git
```

Now you should have a `clean` branch whose upstream is pointing to `PublicRepo`.

## Squashing to the clean branch

After you have `master` in a state where you want to push to the public repo
(e.g., `HEAD` contains no passwords or other untoward information), you can
run `commit_to_clean.sh`. This will squash all the commits since the *last*
time you ran it on top of the `clean` branch with the specified commit message.

```
commit_to_clean.sh <commit message>
```

## Pushing to the clean branch

Finally, if you want to push to the clean branch, you can use the
`push_to_clean.sh` script:

```
push_to_clean.sh
```

## Caveats

This is a jank solution, so we expect janky things. It requires you *not*
to do the following things:
  * Have a reference named `public` in your repo (i.e., no tag or branch)
  * Have a reference named `clean` in your repo
  * Have a one line commit message

Feel free to improve!
