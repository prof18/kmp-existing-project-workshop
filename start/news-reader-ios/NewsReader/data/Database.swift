//
//  Database.swift
//  NewsReader
//
//  Created by marco.gomiero on 23.11.23.
//

import Foundation


let newsJson = """
    [
      {
        "by": "staranjeet",
        "id": 38375239,
        "score": 639,
        "time": 1700632905,
        "title": "We have reached an agreement in principle for Sam to return to OpenAI as CEO",
        "type": "story",
        "url": "https://twitter.com/openai/status/1727206187077370115"
      },
      {
        "by": "klaussilveira",
        "id": 38371361,
        "score": 900,
        "time": 1700605850,
        "title": "Why does the moon change size when you snipe it in GTA?",
        "type": "story",
        "url": "https://insiderockstarnorth.blogspot.com/2023/11/why-does-moon-change-size-when-you.html"
      },
      {
        "by": "roborovskis",
        "id": 38368287,
        "score": 1097,
        "time": 1700593289,
        "title": "Stable Video Diffusion",
        "type": "story",
        "url": "https://stability.ai/news/stable-video-diffusion-open-ai-video-model"
      },
      {
        "by": "yamrzou",
        "id": 38371808,
        "score": 205,
        "time": 1700607790,
        "title": "In the gut's 'second brain,' key agents of health emerge",
        "type": "story",
        "url": "https://www.quantamagazine.org/in-the-guts-second-brain-key-agents-of-health-emerge-20231121"
      },
      {
        "by": "geox",
        "id": 38372687,
        "score": 125,
        "time": 1700612440,
        "title": "Bacteria store memories and pass them on for generations",
        "type": "story",
        "url": "https://news.utexas.edu/2023/11/21/bacteria-store-memories-and-pass-them-on-for-generations/"
      },
      {
        "by": "wglb",
        "id": 38357226,
        "score": 23,
        "time": 1700527714,
        "title": "Phosphorous discovered in outskirts of the Milky Way",
        "type": "story",
        "url": "https://phys.org/news/2023-11-phosphorous-outskirts-milky.html"
      },
      {
        "by": "magoghm",
        "id": 38373191,
        "score": 135,
        "time": 1700615177,
        "title": "FTC authorizes compulsory process for AI-related products and services",
        "type": "story",
        "url": "https://www.ftc.gov/news-events/news/press-releases/2023/11/ftc-authorizes-compulsory-process-ai-related-products-services"
      },
      {
        "by": "whitepoplar",
        "id": 38371307,
        "score": 161,
        "time": 1700605569,
        "title": "I tested four NVMe SSDs from four vendors – half lose FLUSH'd data on power loss",
        "type": "story",
        "url": "https://twitter.com/xenadu02/status/1495693475584557056"
      },
      {
        "by": "sylvestre",
        "id": 38369433,
        "score": 216,
        "time": 1700597761,
        "title": "I kind of killed Mercurial at Mozilla",
        "type": "story",
        "url": "https://glandium.org/blog/?p=4346"
      },
      {
        "by": "dmarto",
        "id": 38373586,
        "score": 40,
        "time": 1700617841,
        "title": "How does Cave/Glade Generator Work",
        "type": "story",
        "url": "https://www.boristhebrave.com/2023/11/19/how-does-cave-glade-generator-work/"
      },
      {
        "by": "EndXA",
        "id": 38362363,
        "score": 27,
        "time": 1700567111,
        "title": "The NASA engineer who made the James Webb Space Telescope work (2022)",
        "type": "story",
        "url": "https://www.wsj.com/articles/nasa-james-webb-space-telescope-greg-robinson-images-11657137487"
      },
      {
        "by": "tosh",
        "id": 38366830,
        "score": 205,
        "time": 1700587871,
        "title": "Video-LLaVA",
        "type": "story",
        "url": "https://github.com/PKU-YuanGroup/Video-LLaVA"
      },
      {
        "by": "Tomte",
        "id": 38362348,
        "score": 54,
        "time": 1700566990,
        "title": "Belgrade's kafana pub culture",
        "type": "story",
        "url": "https://www.theguardian.com/travel/2023/nov/21/people-dance-on-tables-welcome-to-belgrades-kafana-pub-culture"
      },
      {
        "by": "Jimmc414",
        "id": 38370252,
        "score": 300,
        "time": 1700601243,
        "title": "ChatGPT with voice is now available to all free users",
        "type": "story",
        "url": "https://twitter.com/OpenAI/status/1727065166188274145"
      },
      {
        "by": "benbreen",
        "id": 38364179,
        "score": 91,
        "time": 1700577424,
        "title": "Margaret Mead, technocracy, and the origins of AI's ideological divide",
        "type": "story",
        "url": "https://resobscura.substack.com/p/margaret-mead-technocracy-and-the"
      },
      {
        "by": "Tomte",
        "id": 38360260,
        "score": 33,
        "time": 1700549552,
        "title": "Fluent Search",
        "type": "story",
        "url": "https://www.fluentsearch.net/"
      },
      {
        "by": "wglb",
        "id": 38357205,
        "score": 26,
        "time": 1700527618,
        "title": "Brightest flash ever disturbed Earth's atmosphere last year",
        "type": "story",
        "url": "https://phys.org/news/2023-11-brightest-disturbed-earth-atmosphere-year.html"
      },
      {
        "by": "intrepidsoldier",
        "id": 38366536,
        "score": 150,
        "time": 1700586644,
        "title": "Code Search at Google: Han-Wen and Zoekt",
        "type": "story",
        "url": "https://sourcegraph.com/blog/zoekt-creating-internal-tools-at-google"
      },
      {
        "by": "himaraya",
        "id": 38366729,
        "score": 588,
        "time": 1700587243,
        "title": "Binance founder Changpeng Zhao agrees to step down, plead guilty",
        "type": "story",
        "url": "https://www.wsj.com/finance/currencies/binance-ceo-changpeng-zhao-step-down-plead-guilty-01f72a40"
      }
    ]
"""
