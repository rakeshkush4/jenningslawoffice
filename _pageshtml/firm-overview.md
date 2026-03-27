---
title: "About Our Firm"
layout: page-full
titletag: "Firm Overview | Douglas Jennings Law Firm, LLC"
description: "Douglas Jennings Law Firm, LLC, of Bennettsville, SC — quality law for serious on-the-road and on-the-job injuries. Call us at 843-479-2865."
permalink: "/firm-overview/"
titlebar: >
  # About Our Firm
sitemap: true
titlebarImage: /assets/images/titlebar-bg.webp
titlebarImageAlt: A smooth, dark blue background with subtle gradients and textures, creating a modern and clean aesthetic.
titlebarImage-m: /assets/images/titlebar-bg-sm.webp
aboutFirm: >
    ## Accidents And Injuries Attorneys
  
    When you’re injured in a car accident, or if you have suffered any other personal injury due to the negligence or fault of another, count on [the Douglas Jennings Law Firm, LLC](/firm-overview/) to provide you with excellent representation, protect your rights and maximize your recovery.


    These days, big city law firms are making a play for cases in smaller markets in the Pee Dee Region like Bennettsville. They advertise on TV and promise fast results. Seriously injured clients need to make sure their lawyer will take the time to sit down with them and understand the true value of the case. A thorough evaluation of your case includes understanding not only the law but also the potential venue issues so that your case can be maximized for your benefit. In choosing a lawyer, you need to make sure he or she will always put your interests first and not settle your case for dimes on the dollar.
firmImage: /assets/images/about-img.webp
testimonials:
  - image: "/assets/images/avdadge.webp"
    alt: "AV | Preeminent | Martindale-Hubbell | Lawyer Ratings"
    url: https://www.martindale.com/organization/douglas-jennings-law-firm-llc-1266815/
  - image: "/assets/images/superlawyers.webp"
    alt: "Super Lawyers"
    url: https://profiles.superlawyers.com/south-carolina/bennettsville/lawfirm/douglas-jennings-law-firm-llc/46cf1ce6-cfa4-4959-8739-c34d85a96ec0.html
  - image: "/assets/images/national-trial.webp"
    alt: "Member of The National Trial Lawyers | Top 100 Trial Lawyers"
    url: https://thenationaltriallawyers.org/members/douglas-jennings-jr/
practice_areas: >
    ## You Can Count On Personalized Care
    
    Personal injury law works best when the attorney you choose aggressively represents your interests, not his or her firm’s appetite for quick, low-settlement cases. That’s why we take a decidedly old-fashioned approach to representation, whether the case is for a car accident injury, a medical mishap, or a bad faith insurance claim:
practiceAreaBox:
    - title: "We Listen"
      text: "We take the time to get to know you and your case."
    - title: "We Analyze"
      text: "We analyze your case with great care, developing a strategy that will lead to the maximum (not the easiest) compensation."
    - title: "We Execute"
      text: "Our firm is one of the most <br/>respected in South Carolina for sheer effectiveness."
whyChoose: >
    ## Serving South Carolina
  
    Some time ago, former U.S. Senator Ernest “Fritz” Hollings stood in our Bennettsville office’s foyer and exclaimed, “You have the most beautiful law office in all of South Carolina!”

    
    We are indeed proud of our office space, a two-story historic Victorian home known as the “Strauss House,” on Broad Street in Bennettsville. But we are prouder of our track record of serving the people of the Pee Dee Region when they are struggling with an injury or wrongful death or when they are engaged in a battle with an insurance company.

    
    In early 2020, our firm’s satellite office in Charleston, SC was established when Retired Circuit Judge J. Michael Baxley joined the Douglas Jennings Law Firm. Mike has extensive experience in a variety of legal and business settings, and the current focus of his law practice centers on complex business litigation and catastrophic personal injury litigation.
whyChooseImage: /assets/images/house-img.webp
---

<section class="aboutus-sec section-space">
    <div class="container-wrapper">
        <div class="content">
            <div class="colContent">
                <div class="block fadeUp activateOnScroll">
                    {{ page.aboutFirm | markdownify }}
                </div>
            </div>
            <div class="colImg">
                <picture>
                    <source media="(max-width: 480px)" srcset="{{ page.firmImage }} 480w" sizes="100vw">
                    <img src="{{ page.firmImage }}" class="lazyload fadeUp activateOnScroll" alt="Attorneys At Douglas Jennings Law Firm, LLC" />
                </picture>   
                <div class="attorneyInfo">
                    {% assign sortattorneys = site.attorneys |  sort: 'pagePosition' %}
                    {% for attorney in sortattorneys %}
                    <a class="attorneyName fadeUp activateOnScroll active" href="{{ attorney.url }}">
                        Meet {{ attorney.title }} <img class="arrow" src="/assets/images/green-arrow.svg" alt="Arrow" width="45" height="45">
                    </a>
                    {% endfor %}
                    <a class="button fadeUp activateOnScroll" href="/contact/">
                        <span>Schedule Free Consultation</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="testimonials-sec">
    <div class="container-wrapper">
        <div class="testimonialMain w-100 fadeUp activateOnScroll">
            {% for testimonial in page.testimonials %}
            <div class="box">
                <a href="{{ testimonial.url }}" rel="noopener" target="_blank">
                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{{ testimonial.image }}" alt="{{ testimonial.alt }}" class="lazyload" />
                </a>
            </div>
            {% endfor %}
        </div>
    </div>
</div>
<section class="practiceArea practicearea-sec section-space darkblue">
    <div class="container-wrapper">
        <div class="sectionHead text-center w-100 m-auto fadeUp activateOnScroll">
            {{ page.practice_areas | markdownify }}
        </div>
        <div class="content">
            {% for practiceAreaBox in page.practiceAreaBox %}
            <a href="/contact/" class="box fadeUp activateOnScroll">
                <h3>{{ practiceAreaBox.title }}</h3>
                <p>{{ practiceAreaBox.text }}</p>
                <img class="arrow" src="/assets/images/arrow.svg" alt="Arrow" width="45" height="45">                
            </a>
            {% endfor %}
        </div>
    </div>
</section>
<section class="whyChoose whychoose-sec section-space">
    <div class="container-wrapper">
        <div class="content">
            <div class="colImg fadeUp activateOnScroll">
                <picture>
                    <source srcset="{{ page.whyChooseImage }} 550w" sizes="(max-width: 480px) 100vw, 550px" media="(max-width: 480px)" />
                    <img src="{{ page.whyChooseImage }}" class="lazyload" alt="A charming white historic house with a gabled roof, palm tree, and picket fence, located at a street corner under a clear blue sky." />
                </picture>
            </div>
            <div class="colContent fadeUp activateOnScroll">
                {{ page.whyChoose | markdownify }}
                <a class="button" href="/contact/"><span>Schedule Free Consultation</span></a>
            </div>
        </div>
    </div>
</section>

