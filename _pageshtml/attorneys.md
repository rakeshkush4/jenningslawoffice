---
title: "Meet Your Attorneys"
layout: page-full
titletag: "Our Attorneys | Douglas Jennings Law Firm, LLC"
description: "Need quality legal representation in the Pee Dee Region? Contact The Douglas Jennings Law Firm of Bennettsville, SC for quality representation for serious injuries. Call us at 843-479-2865."
titlebar: >
  # Meet Our Attorneys
permalink: "/attorneys/"
sitemap: true
titlebarImage: /assets/images/titlebar-bg.webp
titlebarImageAlt: A smooth, dark blue background with subtle gradients and textures, creating a modern and clean aesthetic.
titlebarImage-m: /assets/images/titlebar-bg-sm.webp
attorneyheading: >
      ## A South Carolina Legal Team That Fights for You

      Our attorneys serve the people of South Carolina — particularly folks in Bennettsville, Dillon, Cheraw, Hartsville, Darlington and other towns in the Pee Dee northeastern corner of South Carolina. To learn more about our lawyers, consult the profile links below.
---

<section class="attorneySec section-space attorneymainSec">
    <div class="container-wrapper">
    	<div class="heading fadeUp activateOnScroll">
    		{{ page.attorneyheading | markdownify }}
    	</div>
        <div class="content">
        {% assign sortattorneys = site.attorneys |  sort: 'pagePosition' %}
        	{% for meetattorney in sortattorneys %}
	            <div class="box">
                    <a href="{{ meetattorney.url }}">
    	            	<div class="attoryneyImg fadeUp activateOnScroll">
    	                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{{ meetattorney.attorneyimage }}" class="lazyload" alt="{{ meetattorney.title }}" />
    	                </div>
    	                <div class="attoryneyContent fadeUp activateOnScroll">
    	                    <h3 class="headthird">{{ meetattorney.title }}</h3>
    	                    <p>{{ meetattorney.attorneySnippet }}</p>
                          <div class="button black-btn">Learn More</div>
    	                </div>
                    </a>
	            </div>
            {% endfor %}                    
        </div>
    </div>
</section> 