# Notes for Vercel Things

## Deployemnts require a webhook through github for CMS updates

# Redirect Examples
```
{
  "redirects": [
      { "source": "/site-map", "destination": "/sitemap.xml", "permanent": true },
      { "source": "/social--events", "destination": "/", "permanent": true },
      { "source": "/mobile-c1yeo", "destination": "/", "permanent": true },
      { "source": "/mobile-cfvg", "destination": "/", "permanent": true },
      { "source": "/wakeboard", "destination": "/wakeboats", "permanent": true }
  ],
  /* THIS IS HOW YOU REDIRECT FOR NO TRAILING SLASH*/
  "rewrites": [
    { "source": "/:path", "destination": "/:path*.html" }
  ]
}
```
