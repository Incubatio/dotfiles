Definition
----------
Depots: is a kind of repo
Stream: is branch of a repo
View: is a map reduce (a selection of element) from depots/streams
Workspace or Client: is an access point for a developer to a depot or a stream or a view
Change: is a commit, it is local or pending as long as it's not submited


Commands:
---------
(working with a centralised repo)
.. git clone
`p4 client -S //sniper2/sp_integration_backend nmorel_osx_sp_integration_backend`
`p4 sync`

.. git commit
`p4 change`
.. will create a <changeset_num>

.. git pull origin master
`p4 sync`

.. git push
`p4 submit -c <changeset_num>`
.. in Sniper, submit is disabled, and one must use native_plugins/P4/submitHelper-osx/submitHelper $P4PORT <changeset_num>

.. git status
`p4 opened`
.. and for a pending changeset
`p4 opened -c <changeset_num>`

.. display file
`p4 change <changeset_num>`

.. git diff
`p4 describe <changeset_num>`

.. revert last changeset
`p4 revert -c <changeset_num>`

.. revert last submit without losing it in history
`p4 undo smth smth`

.. git log
`p4 changes -l -m<number_of_changes> -u<user>`

.. git log <file>
`p4 filelog <file>`

.. a bit like a semaphore, lock the target file on the server, so no one can submit change on it without unlocking it
`p4 lock`
`p4 unlock`

.. by default you have to p4 edit file to edit them, and this is adding them to next changelist/commit
.. by using lock you prevent that file to be added to the changelist

.. git stash
`p4 shelve [files]`

.. git stash pop
`p4 unshelve -s <changeset_num>`

.. git stash remove
`p4 shelve -c <changeset_num> -d`

.. git commit --amend
`p4 change -c <changeset_num>`

.. Note: a shelve is a changelist, the faster way to submit a shelve, is to delete the shelve and submiting the remaining changelist
