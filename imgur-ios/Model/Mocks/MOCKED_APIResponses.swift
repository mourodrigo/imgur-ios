#if DEBUG
import Foundation

class MOCKED_APIResponses {

    static let MOCKED_TopWeeklyResponse: String = """
    {
        "data": [
            {
                "id": "BsehABd",
                "title": "When someone keeps talking bullshit.",
                "description": null,
                "datetime": 1600275379,
                "type": "image/gif",
                "animated": true,
                "width": 728,
                "height": 728,
                "size": 21667518,
                "views": 1306563,
                "bandwidth": 28309977320634,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "memes",
                "account_url": "OctopussSevenTwo",
                "account_id": 23603129,
                "is_ad": false,
                "in_most_viral": true,
                "has_sound": false,
                "ad_type": 0,
                "ad_url": "",
                "edited": 0,
                "in_gallery": true,
                "topic": "No Topic",
                "topic_id": 29,
                "link": "http://i.imgur.com/BsehABdh.gif",
                "mp4": "https://i.imgur.com/BsehABd.mp4",
                "gifv": "https://i.imgur.com/BsehABd.gifv",
                "hls": "https://i.imgur.com/BsehABd.m3u8",
                "mp4_size": 2275845,
                "looping": true,
                "processing": {
                    "status": "completed"
                },
                "ad_config": {
                    "safeFlags": [
                        "in_gallery",
                        "gallery"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [
                        "sixth_mod_unsafe"
                    ],
                    "wallUnsafeFlags": [],
                    "showsAds": false
                },
                "comment_count": 337,
                "favorite_count": 1890,
                "ups": 6066,
                "downs": 142,
                "points": 5924,
                "score": 6576,
                "is_album": false
            },
            {
                "id": "Fm9YdYT",
                "title": "*gets popcorn*",
                "description": null,
                "datetime": 1600267189,
                "cover": "1LZaHTG",
                "cover_width": 1125,
                "cover_height": 1404,
                "account_url": "OhMyYoureSexxy",
                "account_id": 39999977,
                "privacy": "hidden",
                "layout": "blog",
                "views": 172037,
                "link": "https://imgur.com/a/Fm9YdYT",
                "ups": 6978,
                "downs": 477,
                "points": 6501,
                "score": 6586,
                "is_album": true,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "",
                "comment_count": 746,
                "favorite_count": 1248,
                "topic": "No Topic",
                "topic_id": 29,
                "images_count": 1,
                "in_gallery": true,
                "is_ad": false,
                "ad_type": 0,
                "ad_url": "",
                "in_most_viral": true,
                "include_album_ads": false,
                "images": [
                    {
                        "id": "1LZaHTG",
                        "title": null,
                        "description": null,
                        "datetime": 1600267154,
                        "type": "image/jpeg",
                        "animated": false,
                        "width": 1125,
                        "height": 1404,
                        "size": 152218,
                        "views": 105795,
                        "bandwidth": 16103903310,
                        "vote": null,
                        "favorite": false,
                        "nsfw": null,
                        "section": null,
                        "account_url": null,
                        "account_id": null,
                        "is_ad": false,
                        "in_most_viral": false,
                        "has_sound": false,
                        "tags": [],
                        "ad_type": 0,
                        "ad_url": "",
                        "edited": "0",
                        "in_gallery": false,
                        "link": "https://i.imgur.com/1LZaHTG.jpg",
                        "comment_count": null,
                        "favorite_count": null,
                        "ups": null,
                        "downs": null,
                        "points": null,
                        "score": null
                    }
                ],
                "ad_config": {
                    "safeFlags": [
                        "gallery",
                        "in_gallery",
                        "album",
                        "sixth_mod_safe"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [],
                    "wallUnsafeFlags": [],
                    "showsAds": true
                }
            },
            {
                "id": "yYiKOT0",
                "title": "Colbert, when commercial break hits",
                "description": null,
                "datetime": 1600100422,
                "cover": "vIwzt09",
                "cover_width": 960,
                "cover_height": 540,
                "account_url": "BiggusDickus2",
                "account_id": 24705972,
                "privacy": "hidden",
                "layout": "blog",
                "views": 166054,
                "link": "https://imgur.com/a/yYiKOT0",
                "ups": 11286,
                "downs": 361,
                "points": 10925,
                "score": 11007,
                "is_album": true,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "",
                "comment_count": 501,
                "favorite_count": 2992,
                "topic": "No Topic",
                "topic_id": 29,
                "images_count": 1,
                "in_gallery": true,
                "is_ad": false,
                "ad_type": 0,
                "ad_url": "",
                "in_most_viral": true,
                "include_album_ads": false,
                "images": [
                    {
                        "id": "vIwzt09",
                        "title": null,
                        "description": "funny - i posted this at 6am this morning (NY time) and the russian trolls downvoted it to -10. Took it down and tried again at ~11am... They must be asleep now.",
                        "datetime": 1600100350,
                        "type": "video/mp4",
                        "animated": true,
                        "width": 960,
                        "height": 540,
                        "size": 6513289,
                        "views": 2264419,
                        "bandwidth": 14748815364091,
                        "vote": null,
                        "favorite": false,
                        "nsfw": null,
                        "section": null,
                        "account_url": null,
                        "account_id": null,
                        "is_ad": false,
                        "in_most_viral": false,
                        "has_sound": true,
                        "tags": [],
                        "ad_type": 0,
                        "ad_url": "",
                        "edited": "0",
                        "in_gallery": false,
                        "link": "https://i.imgur.com/vIwzt09.mp4",
                        "mp4_size": 6513289,
                        "mp4": "https://i.imgur.com/vIwzt09.mp4",
                        "gifv": "https://i.imgur.com/vIwzt09.gifv",
                        "hls": "https://i.imgur.com/vIwzt09.m3u8",
                        "processing": {
                            "status": "completed"
                        },
                        "comment_count": null,
                        "favorite_count": null,
                        "ups": null,
                        "downs": null,
                        "points": null,
                        "score": null
                    }
                ],
                "ad_config": {
                    "safeFlags": [
                        "album",
                        "in_gallery",
                        "sixth_mod_safe",
                        "gallery"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [],
                    "wallUnsafeFlags": [],
                    "showsAds": true
                }
            },
            {
                "id": "H0smgad",
                "title": "Everyone listen to Handsomer Ryan Reynolds.",
                "description": null,
                "datetime": 1600339807,
                "cover": "MztVYde",
                "cover_width": 684,
                "cover_height": 854,
                "account_url": "TheGhostofElizabethShue",
                "account_id": 19638645,
                "privacy": "hidden",
                "layout": "blog",
                "views": 160650,
                "link": "https://imgur.com/a/H0smgad",
                "ups": 6546,
                "downs": 96,
                "points": 6450,
                "score": 6530,
                "is_album": true,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "",
                "comment_count": 604,
                "favorite_count": 2188,
                "topic": "No Topic",
                "topic_id": 29,
                "images_count": 1,
                "in_gallery": true,
                "is_ad": false,
                "tags": [
                    {
                        "name": "the_more_you_know",
                        "display_name": "the more you know",
                        "followers": 1297363,
                        "total_items": 273922,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "cHaxWH1",
                        "thumbnail_hash": null,
                        "accent": "21B86E",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "facts and knowledge",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    },
                    {
                        "name": "current_events",
                        "display_name": "current events",
                        "followers": 990261,
                        "total_items": 327231,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "kQFyoG7",
                        "thumbnail_hash": null,
                        "accent": "699AAF",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "world news and events",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    },
                    {
                        "name": "unmuted",
                        "display_name": "unmuted",
                        "followers": 1234917,
                        "total_items": 12013,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "tUX1dpv",
                        "thumbnail_hash": "tUX1dpv",
                        "accent": "263BA7",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "videos with sound",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    },
                    {
                        "name": "i_am_an_eagle_wearing_a_haaaaaat",
                        "display_name": "i am an eagle wearing a haaaaaat",
                        "followers": 28,
                        "total_items": 6,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "ILiOaNX",
                        "thumbnail_hash": null,
                        "accent": "4D549A",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    }
                ],
                "ad_type": 0,
                "ad_url": "",
                "in_most_viral": true,
                "include_album_ads": false,
                "images": [
                    {
                        "id": "MztVYde",
                        "title": null,
                        "description": "“biohazard signs”",
                        "datetime": 1600339788,
                        "type": "video/mp4",
                        "animated": true,
                        "width": 684,
                        "height": 854,
                        "size": 4297902,
                        "views": 2235728,
                        "bandwidth": 9608939842656,
                        "vote": null,
                        "favorite": false,
                        "nsfw": null,
                        "section": null,
                        "account_url": null,
                        "account_id": null,
                        "is_ad": false,
                        "in_most_viral": false,
                        "has_sound": true,
                        "tags": [],
                        "ad_type": 0,
                        "ad_url": "",
                        "edited": "0",
                        "in_gallery": false,
                        "link": "https://i.imgur.com/MztVYde.mp4",
                        "mp4_size": 4297902,
                        "mp4": "https://i.imgur.com/MztVYde.mp4",
                        "gifv": "https://i.imgur.com/MztVYde.gifv",
                        "hls": "https://i.imgur.com/MztVYde.m3u8",
                        "processing": {
                            "status": "completed"
                        },
                        "comment_count": null,
                        "favorite_count": null,
                        "ups": null,
                        "downs": null,
                        "points": null,
                        "score": null
                    }
                ],
                "ad_config": {
                    "safeFlags": [
                        "album",
                        "in_gallery",
                        "sixth_mod_safe",
                        "gallery"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [],
                    "wallUnsafeFlags": [],
                    "showsAds": true
                }
            },
            {
                "id": "vum0aM1",
                "title": "Sergeant surprises his son after being on a year long deployment.",
                "description": "Sound: https://streamable.com/hxkjq",
                "datetime": 1600176638,
                "type": "image/gif",
                "animated": true,
                "width": 728,
                "height": 728,
                "size": 119238210,
                "views": 2188674,
                "bandwidth": 260973570033540,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "",
                "account_url": "OctopussSevenTwo",
                "account_id": 23603129,
                "is_ad": false,
                "in_most_viral": true,
                "has_sound": false,
                "tags": [
                    {
                        "name": "aww",
                        "display_name": "aww",
                        "followers": 2582595,
                        "total_items": 754410,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "avRBRpN",
                        "thumbnail_hash": null,
                        "accent": "60AEBB",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "cute and adorable",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    },
                    {
                        "name": "awesome",
                        "display_name": "awesome",
                        "followers": 1263559,
                        "total_items": 748379,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "4kmYoey",
                        "thumbnail_hash": null,
                        "accent": "8472BD",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "neat and amazing",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    },
                    {
                        "name": "reaction",
                        "display_name": "reaction",
                        "followers": 57552,
                        "total_items": 220206,
                        "following": false,
                        "is_whitelisted": false,
                        "background_hash": "UQOCajR",
                        "thumbnail_hash": null,
                        "accent": "7B74BF",
                        "background_is_animated": false,
                        "thumbnail_is_animated": false,
                        "is_promoted": false,
                        "description": "",
                        "logo_hash": null,
                        "logo_destination_url": null,
                        "description_annotations": {}
                    }
                ],
                "ad_type": 0,
                "ad_url": "",
                "edited": 0,
                "in_gallery": true,
                "topic": "No Topic",
                "topic_id": 29,
                "link": "http://i.imgur.com/vum0aM1h.gif",
                "mp4": "https://i.imgur.com/vum0aM1.mp4",
                "gifv": "https://i.imgur.com/vum0aM1.gifv",
                "hls": "https://i.imgur.com/vum0aM1.m3u8",
                "mp4_size": 9677480,
                "looping": true,
                "processing": {
                    "status": "completed"
                },
                "ad_config": {
                    "safeFlags": [
                        "in_gallery",
                        "sixth_mod_safe",
                        "gallery"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [],
                    "wallUnsafeFlags": [],
                    "showsAds": true
                },
                "comment_count": 451,
                "favorite_count": 895,
                "ups": 5590,
                "downs": 201,
                "points": 5389,
                "score": 6481,
                "is_album": false
            },
            {
                "id": "hnZ18Wf",
                "title": "The Germans don't mess around",
                "description": null,
                "datetime": 1600363507,
                "cover": "IZBhwxJ",
                "cover_width": 1440,
                "cover_height": 1821,
                "account_url": "Huhwhatcrazy",
                "account_id": 52175121,
                "privacy": "hidden",
                "layout": "blog",
                "views": 128096,
                "link": "https://imgur.com/a/hnZ18Wf",
                "ups": 6562,
                "downs": 177,
                "points": 6385,
                "score": 6448,
                "is_album": true,
                "vote": null,
                "favorite": false,
                "nsfw": false,
                "section": "",
                "comment_count": 826,
                "favorite_count": 639,
                "topic": "No Topic",
                "topic_id": 29,
                "images_count": 1,
                "in_gallery": true,
                "is_ad": false,
                "tags": [],
                "ad_type": 0,
                "ad_url": "",
                "in_most_viral": true,
                "include_album_ads": false,
                "images": [
                    {
                        "id": "IZBhwxJ",
                        "title": null,
                        "description": null,
                        "datetime": 1600363499,
                        "type": "image/jpeg",
                        "animated": false,
                        "width": 1440,
                        "height": 1821,
                        "size": 281360,
                        "views": 81650,
                        "bandwidth": 22973044000,
                        "vote": null,
                        "favorite": false,
                        "nsfw": null,
                        "section": null,
                        "account_url": null,
                        "account_id": null,
                        "is_ad": false,
                        "in_most_viral": false,
                        "has_sound": false,
                        "tags": [],
                        "ad_type": 0,
                        "ad_url": "",
                        "edited": "0",
                        "in_gallery": false,
                        "link": "https://i.imgur.com/IZBhwxJ.jpg",
                        "comment_count": null,
                        "favorite_count": null,
                        "ups": null,
                        "downs": null,
                        "points": null,
                        "score": null
                    }
                ],
                "ad_config": {
                    "safeFlags": [
                        "album",
                        "in_gallery",
                        "gallery"
                    ],
                    "highRiskFlags": [],
                    "unsafeFlags": [
                        "sixth_mod_unsafe"
                    ],
                    "wallUnsafeFlags": [],
                    "showsAds": false
                }
            }
        ],
        "success": true,
        "status": 200
    }
    """

}

#endif
