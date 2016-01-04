Twitter = require 'twitter'

module.exports = ->
  status = process.argv[2]

  throw new Error('bbn-t <status>') unless status?

  consumerKey = process.env.BBN_T_CONSUMER_KEY
  consumerSecret = process.env.BBN_T_CONSUMER_SECRET
  accessTokenKey = process.env.BBN_T_ACCESS_TOKEN
  accessTokenSecret = process.env.BBN_T_ACCESS_TOKEN_SECRET
  twitter = new Twitter
    consumer_key: consumerKey
    consumer_secret: consumerSecret
    access_token_key: accessTokenKey
    access_token_secret: accessTokenSecret

  twitter.post 'statuses/update', { status }, (err, result) ->
    if err?
      console.error err
    else
      { user, id_str, text } = result
      console.log "https://twitter.com/#{user.name}/status/#{id_str}\n#{text}"
