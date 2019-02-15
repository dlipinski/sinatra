require 'active_record'

Activeecord::Base.establishConnection({
    database: 'finatra_db',
    adapter: 'sqlite3'
})