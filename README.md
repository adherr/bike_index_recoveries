# bike_index_recoveries

Will interact with the BikeIndex.org API in order to recieve information about and display lists of bikes recovered with the help of BikeIndex.org (and StolenBikeRegistry.com).

## Facebook setup Is kind of a pain in the ass. Everything you need to
know comes from here:
[https://developers.facebook.com/docs/facebook-login/access-tokens/](https://developers.facebook.com/docs/facebook-login/access-tokens/). Namely
that you need a page-token to update a page, and that in order to get
a page token, you have to get a user-token and then ask for
me/accounts. I'll try to lay out the process I used here.
1.  Sign up the application at [https://developers.facebook.com/](https://developers.facebook.com/)
2.  Open a new tab pointed to the Graph Explorer tool
   [https://developers.facebook.com/tools/explorer](https://developers.facebook.com/tools/explorer)
3.  Use the Application drop down to select your application
4.  Click `Get Access Token` and don't click any boxes, just do `Get Access Token`
5.  If you want to, do a `GET` to `/v2.0/me` (optional)
6.  Click `Get Access Token` again. This time, select `Extended
    Permissions` and then the boxes `publish_actions` and
    `manage_pages`, and then `Get Access Token`.
7.  Now you have a short term user-token for yourself in the `Access
    Token` field in the Graph Explorer. If you do a `GET` to
    `/v2.0/me/accounts` you'll see what pages you have access to,
    access tokens for you to use those pages through the API, and your
    permissions on those pages. However this is a short term (a few
    hours) access token to the page. We want a forever page-token.
8.  To get a forever page-token, you have to do the `GET` to
    `/v2.0/me/accounts` using a long-term user-token. To get that,
    whip out curl or your preferred method of receiving JSON, perform
    the following at `https://graph.facebook.com`

        GET /oauth/access_token?
        grant_type=fb_exchange_token&
        client_id={app-id}&
        client_secret={app-secret}&
        fb_exchange_token={short-lived-token}

    where `app-id` and `app-secret` are on the page you still have
    open from step 1, and short-lived-token is what you got in step 6.
9.  The `access_token`  you receive in the JSON response  is your long
    term  user-token (as  you can  see from  its 60  day expiry time,
    listed  in seconds).  Copy  this `access_token`  into the  `Access
    Token` field in the Graph Explorer
10. Use the explorer to `GET` `/v2.0/me/accounts` again. This time the
    access token is a page-token that will never expire. Save this to
    your secrets file that you'll use in the app to post to
    facebook. If you'd like to verify that it won't expire, you can
    use curl or whatever to

        GET graph.facebook.com/debug_token?
        input_token={token-to-inspect}
        &access_token={app-token-or-admin-token}

    where `token-to-inspect` is that new page-token and `admin-token`
    is a viable user-token for an admin of the app (you, presumably,
    because you just created the app) (use your access token from step
    6 or 9 here). Don't worry about `app-token`. This should give you
    some JSON with an `issued_at` UNIX time and an `"expires_at": 0`
