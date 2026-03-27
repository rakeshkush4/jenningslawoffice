# Welcome to the Jekyll CMS generator

Here you will find instructions for uploading blog posts and internal pages.

**All posts are written in markdown the easy to read text format**

A fantastic guide to markdown can be found online here [https://commonmark.org/help/](https://commonmark.org/help/) 

And there is a great interactive markdown creator here that can be used and copied into the file [https://markdown-editor.github.io/](https://markdown-editor.github.io/)

## Pages

Create a new markdown file inside the _pages director with your page name and extension .md like so: page-name.md Every new page starts every with the "front matter" shown below content example also included

```
---
layout: page
title: page name for netlify organization
titletag: page Title Tag goes here
description: page Description goes here
titlebar: >
  # h1 titlebar text
permalink: /permalink-here/
sitemap: true
---

you can write regular paragraphs out like this.

```


## Blog Posts

All blog posts are made in the `_articles` directory by opening the articles folder and clicking Add file -> Create new file. All new posts must follow the article-post-name.md format shown in the example below:


```
example-test-blog-post.md 
```

Start every new posts by copying the "front matter" below shown here. This will be used to create the page meta data and create the blog snippit that is added to the /blog/ page on the website. content example also

```
---
title: h1 will go here for SEO and URL
layout: post
titletag: Title Tag Goes Here
description: Description Goes Here
categories: 
  - Cat 1
  - Cat 2
date: YYYY-MM-DD
permalink: /permalink-here/
sitemap: true // use false for the pdf or external linked posts
downloadlink: if a pdf link
externallink: external URL
robots: index, follow // use noindex, nofollow for external posts or pdf posts
---

Paragraph or h2 content would start here. The H1 is added into the blog posts automatically.

```

## Netlify

Log in to https://website.com/admin/ to access Netlify editor
