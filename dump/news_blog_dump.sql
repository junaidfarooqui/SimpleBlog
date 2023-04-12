-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 11, 2023 at 01:09 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `newsblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `category_ids` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `content`, `image_url`, `author_id`, `meta_keyword`, `meta_description`, `category_ids`, `date_created`) VALUES
(4, 'Where does this title come from?', 'where-does-it-come-from', '<div>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>\r\n<div>\r\n<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>\r\n<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\r\n<h3>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n<p>\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\r\n<h3>1914 translation by H. Rackham</h3>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\r\n<h3>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3>\r\n<p>\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\r\n</div>', '../uploads/rm.jpg', 1, 'meta, keyword', 'this is description for the article', '1, 2, 6', '2023-04-02 11:55:05'),
(5, 'Why latin instruments will make you question everything', 'why-latin-instruments-will-make-you-question-everything', '<p>Why concert tickets are killing you. The oddest place you will find music scores. 9 facts about billboard alternatives that\'ll keep you up at night. 14 podcasts about country billboards. Why piano stores are afraid of the truth. How hollywood got music festivals all wrong. 16 movies with unbelievable scenes about top new songs. 7 ways hot songs can make you rich. How to cheat at piano stores and get away with it. The 11 best billboard alternative youtube videos.</p>\r\n<h2>Heading</h2>\r\n<p>11 secrets about summer music festivals the government is hiding. All these typography tests depend on default post editor of Blogger / Blogspot. Why the world would end without music apps. Unbelievable dance playlist success stories.</p>\r\n<h3>sub-Heading</h3>\r\n<p>Why mom was right about popular songs. The only free dance resources you will ever need. The evolution of radio stations. 5 ways billboard alternatives can make you rich. An expert interview about music apps. Billboard music awards in 7 easy steps. Why country song ringtones are on crack about country song ringtones. How twitter can teach you about rock fame. 17 myths uncovered about country billboards. Why you\'ll never succeed at best rock songs.</p>\r\n<h4>MinorHeading</h4>\r\n<p>The 11 best music video twitter feeds to follow.&nbsp;<strong>This is bold text</strong>. How concert tickets changed how we think about death.&nbsp;<em>This is italic text</em>. Why concert tickets are the new black.&nbsp;<u>This is underline text</u>. 12 ways popular songs could leave you needing a lawyer.&nbsp;<s>This is linethrough text</s>. The best ways to utilize piano stores.&nbsp;This is color text. The 14 biggest piano store blunders.&nbsp;This is highlight background text. 16 myths uncovered about music festivals.</p>\r\n<h2>Aligned Texts</h2>\r\n<div>Why rock bands are the new black. This is center align text. How to cheat at music scores and get away with it.</div>\r\n<div>7 movies with unbelievable scenes about top new songs. This is right align text. 15 bs facts about music apps everyone thinks are true.</div>\r\n<div>The only country billboard resources you will ever need. This is justify align text. How latin music videos made me a better person.</div>\r\n<h2>List Texts</h2>\r\n<div>This is list of ol</div>\r\n<ol>\r\n<li>Why do people think country billboards are a good idea?</li>\r\n<li>How top new songs are the new top new songs</li>\r\n<li>How music scores can make you sick</li>\r\n<li>Why our world would end if music scores disappeared</li>\r\n</ol>\r\n<div>This is list of ul</div>\r\n<ul>\r\n<li>16 bs facts about free dances everyone thinks are true</li>\r\n<li>The 10 worst songs about music videos</li>\r\n<li>Why latin music videos will make you question everything</li>\r\n<li>9 podcasts about billboard alternatives</li>\r\n</ul>\r\n<div>Music apps in 12 easy steps. The 5 best free song twitter feeds to follow. The oddest place you will find top new songs. Why do people think popular songs are a good idea? Why you\'ll never succeed at pop music books. What wikipedia can\'t tell you about rock fame. The oddest place you will find latin instruments. What wikipedia can\'t tell you about piano stores. Why your rock band never works out the way you plan. How concert tickets can help you predict the future.</div>\r\n<h2>Blockquote Texts</h2>\r\n<blockquote class=\"tr_bq\">How hot songs changed how we think about death. How to be unpopular in the concert ticket world. Why jazz coffee bars are killing you. Why your summer music festival never works out the way you plan. Why music videos should be 1 of the 7 deadly sins. 6 ideas you can steal from concert events. Will pop music books ever rule the world? 20 podcasts about country song ringtones. What the beatles could learn from country song ringtones. 18 bs facts about music scores everyone thinks are true.</blockquote>', '../uploads/music_flying-with-music_135K.jpeg', 1, '', '', '4, 5', '2023-04-02 22:28:58'),
(6, '18 great articles about special sport medals', '18-great-articles-about-special-sport-medals', '<p>13 myths uncovered about baseball quotes. 13 insane (but true) things about tennis warehouses. Why sports fan stores are the new black. Ways your mother lied to you about free sports picks. The only sexy sports fan resources you will ever need. Football highlights by the numbers. Why the next 10 years of college baseball ranking will smash the last 10. Why baseball cards are afraid of the truth. Why mom was right about baseball quotes. The complete beginner\'s guide to sport scores.<br><br>20 things about betting offers your kids don\'t want you to know. How sexy sports fans are making the world a better place. The complete beginner\'s guide to sexy sports fans. Why baseball cards should be 1 of the 7 deadly sins. Will tennis warehouses ever rule the world? The 18 biggest sport cricket blunders. What wikipedia can\'t tell you about betting offers. Why the next 10 years of football highlights will smash the last 10. The 13 best baseball card twitter feeds to follow. The 14 worst sport betting tips in history.<br><br><iframe src=\"https://www.youtube.com/embed/dJelBoKfaHw?rel=0\" width=\"853\" height=\"480\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>\r\n<div><em>Video Uses Code from Youtube or by Blogger Editor</em></div>\r\n<p><br>Why football teams beat peanut butter on pancakes. The 19 worst free sports picks in history. How twitter can teach you about live tennis scores. Unbelievable sports fan store success stories. Why baseball cards are the new black. Sport scores in 16 easy steps. 11 things about sporting indexes your kids don\'t want you to know. Why olympic national parks will change your life. Why sport scores are killing you. Why your football schedule never works out the way you plan.<br><br></p>\r\n<div class=\"separator\"><iframe class=\"YOUTUBE-iframe-video\" src=\"https://www.youtube.com/embed/W5l32wesWjc?feature=player_embedded\" width=\"320\" height=\"266\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" data-thumbnail-src=\"https://i.ytimg.com/vi/W5l32wesWjc/0.jpg\"></iframe></div>\r\n<div><em>Video Uses Code from Youtube or by Blogger Editor</em></div>\r\n<p><br>16 bs facts about baseball quotes everyone thinks are true. 5 ways free sports picks can find you the love of your life. What the beatles could learn from sporting indexes. What experts are saying about olympic national parks. How hollywood got sports bras all wrong. 16 things your boss expects you know about baseball cards. How to be unpopular in the sports fan website world. Why basketball games are killing you. Why betting offers should be 1 of the 7 deadly sins. 12 facts about watch live sport that will impress your friends.</p>', '../uploads/sport_biker-for-charity_115K.jpeg', 1, '', '', '8, 9', '2023-04-02 23:13:59'),
(7, '12 problems with celebrity houses', '12-problems-with-celebrity-houses', '<div class=\"separator\">Why mom was right about inspirational stories. How to be unpopular in the individual right world. The 11 best resources for money saving tips. 16 secrets about money saving tips the government is hiding. Money saving tips by the numbers. 16 things about celebrity photos your kids don\'t want you to know. What everyone is saying about celebrity gossip pictures. What the world would be like if individual sport didn\'t exist. Individual rights by the numbers. What the beatles could learn from luxury lifestyles.</div>\r\n<div class=\"separator\">&nbsp;</div>\r\n<div class=\"separator\"><img src=\"http://4.bp.blogspot.com/-sjwCSOtitzM/VffNQ4OSDgI/AAAAAAAAOOU/fTcVl5UOEDY/s1600/life_found-a-new-happiness_194K.jpg\" alt=\"Dummy Image With Link to Itself\" border=\"0\"><br>Why the world would end without celebrity houses. 12 bs facts about celebrity gossip pictures everyone thinks are true. How individual rights can help you predict the future. Why you shouldn\'t eat wedding hairstyle in bed. The 12 best wedding invitation twitter feeds to follow. An expert interview about gossip movies. 12 secrets about individual development plans the government is hiding. 6 ways individual sport is completely overrated. How gossip movies made me a better person. An expert interview about inspirational quotes.<br><br></div>\r\n<div class=\"separator\"><img src=\"http://4.bp.blogspot.com/-IGbPi4UG64A/VffNRn_qu0I/AAAAAAAAOOk/gYTVxdHGhJ8/s1600/life_you-can-feel-the-bite_189K.jpg\" alt=\"Dummy Image With Link to Itself\" width=\"320\" border=\"0\"></div>\r\n<p>What the world would be like if makeup brushes didn\'t exist. What the beatles could learn from inspirational books. Why our world would end if individual development plans disappeared. The 11 worst songs about gossip movies. Why inspirational stories should be 1 of the 7 deadly sins. If you read one article about celebrity tattoos read this one. 16 ideas you can steal from homemade beauty products. 8 things about wedding gifts your kids don\'t want you to know. Why beauty salons beat peanut butter on pancakes. The evolution of celebrity gossip pictures.<br><br>How celebrity gossip pictures are making the world a better place. The complete beginner\'s guide to beauty essentials. How individual sport changed how we think about death. If you read one article about inspirational books read this one. The oddest place you will find makeup brushes. The 9 biggest lifestyle market blunders. What experts are saying about homemade beauty products. 7 uses for inspirational stories. How inspirational stories can help you live a better life. How to start using individual sport.<br><br></p>\r\n<div class=\"separator\"><img src=\"http://1.bp.blogspot.com/-pMaeb6Re9Lg/VffNUiKP9WI/AAAAAAAAOP4/AhJgx_kiC40/s1600/lifestyle_vintage-jeans-zara-boyfriends_132K.jpg\" width=\"320\" border=\"0\"></div>\r\n<p>Why managing finances beat peanut butter on pancakes. Why individual sport is the new black. The evolution of beauty salons. What experts are saying about budget calculators. Celebrity gossip pictures in 11 easy steps. The best ways to utilize individual sport. Why the world would end without beauty essentials. 18 secrets about makeup brushes the government is hiding. How inspirational books made me a better person. The unconventional guide to lifestyle blogs.<br><br>How individual sport is the new individual sport. 12 things that won\'t happen in beauty essentials. Why celebrity photos beat peanut butter on pancakes. 20 bs facts about celebrity tattoos everyone thinks are true. Why money saving tips are the new black. How to start using professional beauty supplies. 6 things about love quotes your kids don\'t want you to know. The unconventional guide to beauty marks. What everyone is saying about budget calculators. What the beatles could learn from celebrity photos.</p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://2.bp.blogspot.com/-hl0V2puAV0Q/VffNS7KkPQI/AAAAAAAAOPE/tVjzZjaxf9Q/s1600/lifestyle_girl-style-with-skateboard-wallpapers_148K.jpg\" alt=\"Dummy Image With Link to Itself\" border=\"0\"></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Align Center Image with Caption</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>How to cheat at luxury lifestyles and get away with it. How wedding invitations changed how we think about death. The evolution of luxury lifestyles. 17 facts about gossip magazines that will impress your friends. How not knowing wedding invitations makes you a rookie. How twitter can teach you about wedding gifts. 10 ways inspirational stories can find you the love of your life. What wikipedia can\'t tell you about wedding invitations. Luxury lifestyles in 20 easy steps. The evolution of inspirational stories.</p>', '../uploads/lifestyle_couple-on-car_255K.jpeg', 1, 'celebrity houses', 'celebrity houses', '4', '2023-04-03 22:54:08'),
(8, 'An expert interview about healthy eating meal plans', 'an-expert-interview-about-healthy-eating-meal-plans', '<div class=\"separator\">7 myths uncovered about cholesterol lowering food. The evolution of healthy eating meal plans. What the world would be like if cholesterol lowering food didn\'t exist. Why you shouldn\'t eat health quote in bed. 10 things about nutrition facts your kids don\'t want you to know. 17 least favorite weight loss supplements. How vaccine ingredients can help you live a better life. How to start using medicine shops. Why you shouldn\'t eat naturopathic medicine in bed. 12 things you don\'t want to hear about weight loss supplements.</div>\r\n<div class=\"separator\"><a href=\"#\"><img src=\"http://4.bp.blogspot.com/-6oXB-v4endM/VffMC7VTrqI/AAAAAAAAOIk/z2DkkP8Ib3Y/s1600/health_chestnut-and-your-reins_1280K.jpg\" alt=\"Dummy Image With Link to Itself\" border=\"0\"></a></div>\r\n<p><br><br>Expose: you\'re losing money by not using healthy eating meal plans. 9 insane (but true) things about fitness equipment. 8 ideas you can steal from nutrition label makers. 8 ideas you can steal from health informatics. 12 insane (but true) things about weight loss success stories. 8 facts about travel vaccines that will impress your friends. The unconventional guide to travel medicines. What the world would be like if fitness magazines didn\'t exist. 20 movies with unbelievable scenes about naturopathic medicines. How fitness programs changed how we think about death.<br><br></p>\r\n<div class=\"separator\"><a href=\"http://4.bp.blogspot.com/-NTEq3MiPFiQ/VffMDUBpcoI/AAAAAAAAOIw/cOVgKQ_B_Yw/s1600/health_coffee-for-better-work_216K.jpg\"><img src=\"http://4.bp.blogspot.com/-NTEq3MiPFiQ/VffMDUBpcoI/AAAAAAAAOIw/cOVgKQ_B_Yw/s1600/health_coffee-for-better-work_216K.jpg\" alt=\"Dummy Image With Link to Itself\" width=\"320\" border=\"0\"></a></div>\r\n<p>8 facts about fitness programs that will impress your friends. Why fitness equipment will change your life. Unbelievable fitness program success stories. 11 secrets about weight loss meal plans the government is hiding. Why preventative medicines should be 1 of the 7 deadly sins. The complete beginner\'s guide to medicine shops. Why the world would end without preventative medicines. 7 facts about health informatics that will impress your friends. The evolution of cholesterol levels. Will nutrition facts ever rule the world?<br><br>9 things your boss expects you know about fitness equipment. The unconventional guide to relapse prevention worksheets. Expose: you\'re losing money by not using travel vaccines. Why mom was right about healthy eating meal plans. 12 amazing fitness magazine pictures. How healthy eating facts can help you live a better life. 5 bs facts about naturopathic medicines everyone thinks are true. 17 ways nutrition facts could leave you needing a lawyer. How health care providers make you a better lover. 7 ideas you can steal from fitness magazines.<br><br></p>\r\n<div class=\"separator\"><a href=\"http://4.bp.blogspot.com/-IjhoMNmE0YA/VffMDKe2xOI/AAAAAAAAOIs/kmoojJzU-S0/s1600/health_children-nerve-and-emotion_053K.jpg\"><img src=\"http://4.bp.blogspot.com/-IjhoMNmE0YA/VffMDKe2xOI/AAAAAAAAOIs/kmoojJzU-S0/s1600/health_children-nerve-and-emotion_053K.jpg\" width=\"320\" border=\"0\"></a></div>\r\n<p>Why the next 10 years of travel medicines will smash the last 10. Why the next 10 years of healthy eating tips will smash the last 10. 8 facts about healthy eating meal plans that\'ll keep you up at night. How preventative medicines aren\'t as bad as you think. 18 bs facts about naturopathic medicines everyone thinks are true. The 15 worst nutrition facts in history. What experts are saying about health care providers. 8 podcasts about health care providers. Why healthy eating facts will change your life. Why our world would end if health informatics disappeared.<br><br>Why our world would end if healthy eating tips disappeared. How to start using vaccination schedules. 16 things about vaccine ingredients your kids don\'t want you to know. What experts are saying about health care providers. 18 insane (but true) things about naturopathic medicines. Why cholesterol lowering food is on crack about cholesterol lowering food. Why health quotes should be 1 of the 7 deadly sins. How nutrition facts can make you sick. How cholesterol lowering food isn\'t as bad as you think. Why you\'ll never succeed at health quotes.</p>', '../uploads/automotive_ferrari-on-roadmap_290K.jpeg', 1, '', '', '1, 3', '2023-04-03 23:46:41'),
(9, 'Women cloths by the numbers', 'women-cloths-by-the-numbers', '<p>19 things your boss expects you know about fashion weeks. Why dress shops beat peanut butter on pancakes. The unconventional guide to stylists. Will fashion collections ever rule the world? Why cheap cloths should be 1 of the 7 deadly sins. How to start using stylists. 18 ideas you can steal from summer outfits. How twitter can teach you about summer outfits. The 12 worst songs about plus size dresses. How to be unpopular in the fashion nail world.<br><br>Unbelievable fashion nail success stories. Why spring dresses are on crack about spring dresses. The unconventional guide to stylists. 17 facts about online boutiques that\'ll keep you up at night. Why our world would end if fashion shows disappeared. Why trends should be 1 of the 7 deadly sins. 7 ways dress shops can find you the love of your life. Why clothing stores will make you question everything. Why our world would end if stylists disappeared. How hairstyles can help you live a better life.<br><br></p>\r\n<div class=\"separator\"><a href=\"http://2.bp.blogspot.com/-HhVxuVyR8zc/VffHqFDVuhI/AAAAAAAANz8/Gt-BnZCa3I8/s1600/fashion_sad-paris-day_106K.jpg\"><img src=\"http://2.bp.blogspot.com/-HhVxuVyR8zc/VffHqFDVuhI/AAAAAAAANz8/Gt-BnZCa3I8/s1600/fashion_sad-paris-day_106K.jpg\" alt=\"Dummy Image With Link to Itself\" width=\"320\" border=\"0\"></a></div>\r\n<p>What the world would be like if clothing stores didn\'t exist. Unbelievable cheap cloth success stories. How trendy cloths are the new trendy cloths. If you read one article about fashion magazines read this one. Women cloths by the numbers. 19 things that won\'t happen in fashion magazines. How makeup artists can make you sick. How spring dresses make you a better lover. 10 podcasts about cloth accessories. The 12 best makeup artist twitter feeds to follow.<br><br>5 things your boss expects you know about cloth accessories. Why makeup artists are killing you. Why salon services are the new black. Unbelievable spring dress success stories. Why cheap cloths are the new black. How to cheat at summer dresses and get away with it. The 8 biggest fashion nail blunders. The 11 best resources for fashion angels. How summer dresses can help you predict the future. Why fashion collections will make you question everything.<br><br></p>\r\n<div class=\"separator\"><a href=\"http://1.bp.blogspot.com/-PzouSjQooQM/VffHmN7GryI/AAAAAAAANyg/tXZZ2w6vHxI/s1600/fashion_Chelsea-Francis_169K.jpg\"><img src=\"http://1.bp.blogspot.com/-PzouSjQooQM/VffHmN7GryI/AAAAAAAANyg/tXZZ2w6vHxI/s1600/fashion_Chelsea-Francis_169K.jpg\" width=\"320\" border=\"0\"></a></div>\r\n<p>17 things that won\'t happen in spring dresses. 13 ways hairstyles can find you the love of your life. The 19 biggest fashion nail blunders. How fashion magazines aren\'t as bad as you think. The unconventional guide to women cloths. What wikipedia can\'t tell you about plus size dresses. Unbelievable fashion trend success stories. Why fashion weeks will make you question everything. The 5 best fashion magazine youtube videos. What the beatles could learn from trends.<br><br>Why mom was right about stylists. 19 things your boss expects you know about fashion designers. 11 facts about fashion collections that\'ll keep you up at night. 15 ways clothing websites could leave you needing a lawyer. How trends can make you sick. The best ways to utilize fashion weeks. Unbelievable summer outfit success stories. 18 ways fashion weeks can make you rich. What wikipedia can\'t tell you about trends. How to start using women cloths.</p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"http://4.bp.blogspot.com/-1kgaNTtXy7w/VffHoSu1GrI/AAAAAAAANzQ/PkgKu2FXDOI/s1600/fashion_girl-outdoor-in-park_224K.jpg\"><img src=\"http://4.bp.blogspot.com/-1kgaNTtXy7w/VffHoSu1GrI/AAAAAAAANzQ/PkgKu2FXDOI/s1600/fashion_girl-outdoor-in-park_224K.jpg\" alt=\"Dummy Image With Link to Itself\" border=\"0\"></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Align Center Image with Caption</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>6 least favorite hairstyles. The best ways to utilize models. What the beatles could learn from sexy cloths. Why mom was right about summer dresses. The complete beginner\'s guide to fashion angels. How to start using spring dresses. How to be unpopular in the summer dress world. What experts are saying about hairstyles. The unconventional guide to women cloths. 17 things that won\'t happen in dress shops.<br><br></p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"http://3.bp.blogspot.com/-OkJOjTZPcz0/VffHtXOqEvI/AAAAAAAAN08/4jRajLG4wSo/s1600/fasion_summer-trend-models_235K.jpg\"><img src=\"http://3.bp.blogspot.com/-OkJOjTZPcz0/VffHtXOqEvI/AAAAAAAAN08/4jRajLG4wSo/s1600/fasion_summer-trend-models_235K.jpg\" alt=\"Dummy Image With Link to Itself\" width=\"320\" border=\"0\"></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Float Left Image with Caption</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>The 16 best unique dress youtube videos. Why you\'ll never succeed at fashion weeks. The 14 best cheap cloth youtube videos. 12 facts about fashion weeks that\'ll keep you up at night. How makeup artists made me a better person. Why your online boutique never works out the way you plan. 14 least favorite hairstyles. 13 things you don\'t want to hear about fashion nails. 13 insane (but true) things about trends. 8 least favorite unique dresses.<br><br>Why sexy cloths are the new black. Will fashion angels ever rule the world? How not knowing fashion designers makes you a rookie. Expose: you\'re losing money by not using models. Why the world would end without pretty dresses. 6 ways models can make you rich. Why sexy cloths beat peanut butter on pancakes. How wholesale dresses made me a better person. Why hairstyles are the new black. The oddest place you will find unique dresses.<br><br></p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"http://1.bp.blogspot.com/-PzouSjQooQM/VffHmN7GryI/AAAAAAAANyg/tXZZ2w6vHxI/s1600/fashion_Chelsea-Francis_169K.jpg\"><img src=\"http://1.bp.blogspot.com/-PzouSjQooQM/VffHmN7GryI/AAAAAAAANyg/tXZZ2w6vHxI/s1600/fashion_Chelsea-Francis_169K.jpg\" width=\"320\" border=\"0\"></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Float Right Image with Caption</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Why hairstyles are killing you. 7 ways wholesale dresses can find you the love of your life. Why cloth accessories are the new black. Why stylists are afraid of the truth. 10 ways fashion trends could leave you needing a lawyer. Why fashion magazines are on crack about fashion magazines. Why mom was right about fashion trends. 5 ways fashion shows can find you the love of your life. Ways your mother lied to you about summer dresses. Why your sexy cloth never works out the way you plan.</p>', '../uploads/fashion_Chelsea-Francis_169K.jpeg', 1, '', '', '8, 9', '2023-04-03 23:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `date_created`) VALUES
(1, 'Technology', 'technology', NULL, '2023-03-26 00:00:00'),
(2, 'Software', 'software', '1', '2023-03-26 00:00:00'),
(3, 'Hardware', 'hardware', '1', '2023-03-26 00:00:00'),
(4, 'Business', 'business', NULL, '2023-03-26 00:00:00'),
(5, 'Finance', 'finance', '4', '2023-03-26 00:00:00'),
(6, 'Robotics AI', '', '1', '2023-04-01 13:48:05'),
(8, 'Sports', 'sports', '', '2023-04-02 22:55:38'),
(9, 'Football', 'football', '8', '2023-04-02 23:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text,
  `status` varchar(255) DEFAULT 'pending',
  `author_id` varchar(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `headline`, `email`, `content`, `status`, `author_id`, `article_id`, `reference_id`, `date_created`) VALUES
(1, 'Junaid Farooqui', 'asdasdasdas', 'junaidfarooq61@gmail.com', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 'approved', '1', 4, '', '2023-04-06 14:26:09'),
(2, 'Junaid Farooqui', 'This is new comment', 'junaidfarooq61@gmail.com', '                                            oluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"                                                                                ', 'approved', '1', 4, '', '2023-04-08 10:45:40'),
(3, 'Junaid Farooqui', 'reply to comment 1', 'junaidfarooq61@gmail.com', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'approved', '1', 4, '1', '2023-04-08 11:07:05'),
(4, 'Junaid Farooqui', 'Another comment Testing', 'junaidfarooq61@gmail.com', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,', 'pending', '1', 4, '', '2023-04-08 11:45:55'),
(5, 'Junaid Farooqui', 'Comment success action testing', 'junaidfarooq61@gmail.com', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', 'pending', '1', 4, '', '2023-04-08 14:13:06'),
(6, 'Junaid Farooqui', 'comment message testing', 'junaidfarooq61@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore', 'pending', '1', 4, '', '2023-04-08 14:43:41'),
(7, 'Junaid Farooqui', 'new comment with login', 'junaidfarooq61@gmail.com', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet', 'pending', '1', 4, '', '2023-04-10 17:28:06'),
(12, 'Junaid Farooqui', 'new comment with login', 'junaidfarooq61@gmail.com', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" ', 'approved', '1', 4, '', '2023-04-10 17:44:27'),
(13, 'Incognito', 'comment without login', 'incognito@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation', 'pending', '', 4, '', '2023-04-10 18:03:10'),
(14, 'Incognito', 'Another comment without login', 'incogonit@gmail.com', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'pending', '', 4, '', '2023-04-10 18:05:01'),
(15, 'Incognito', 'Another comment without login', 'incogonit@gmail.com', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'pending', '', 4, '', '2023-04-10 18:05:18'),
(16, 'Junaid Farooqui', 'This nice Article', 'junaidfarooq61@gmail.com', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 'approved', '1', 7, '', '2023-04-10 18:06:21'),
(17, 'Junaid Farooqui', 'comment news Rackham', 'junaidfarooq61@gmail.com', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. E', 'approved', '1', 4, '', '2023-04-10 21:53:20'),
(18, 'Junaid Farooqui', 'The standard Lorem Ipsum passage', 'junaidfarooq61@gmail.com', ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident', 'approved', '1', 4, '', '2023-04-10 22:00:11'),
(19, 'Junaid Farooqui', 'No good replu', 'junaidfarooq61@gmail.com', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those', 'approved', '1', 4, '17', '2023-04-10 22:01:32'),
(20, 'Junaid Farooqui', 'this first comment on this article', 'junaidfarooq61@gmail.com', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,', 'approved', '1', 5, '', '2023-04-10 22:27:03'),
(21, 'incignito', '1914 translation by H. Rackham', 'hello@yellow.com', 'when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. ', 'pending', '', 5, '', '2023-04-10 22:37:26'),
(22, 'incognito', 'Waar komt het vandaan?', 'blue@green.com', 'n tegenstelling tot wat algemeen aangenomen wordt is Lorem Ipsum niet zomaar willekeurige tekst. het heeft zijn wortels in een stuk klassieke latijnse literatuur', 'pending', '', 5, '', '2023-04-10 22:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `role`, `role_id`, `date_created`) VALUES
(1, 'admin', 'Junaid', 'Farooqui', 'junaidfarooq61@gmail.com', '$2y$10$7CQK.tjXR/Y0ZEuAFsB92.9QD79awgxl8TsWhQzZ/YA24LDjCaiCa', 'administrator', 1, '2023-03-31'),
(2, 'testingSubscriber', 'Testing', 'Subscriber', 'testing.subscriber@gmail.com', '$2y$10$/IVyWcOstM7gvxQzCEJEDOPUHSwbzsFAuisDtn1TAUeozabxuPv2u', 'subscriber', 2, '2023-04-10'),
(4, 'testingEditor', 'Testing', 'Editor', 'testing.editor@gmail.com', '$2y$10$qIopuKk8hgJkbGjJPXBNvOXLhOxiVcfY/HOMrb6lv9Wj3gbCfBu7m', 'editor', 3, '2023-04-10'),
(5, 'anotherTesting', 'Another', 'Testing', 'anothet.testing@gmail.com', '$2y$10$a0Mb5LenTeeavBJ1wDwE..p85V8X5oChFpoAVURJl5MganjiZSCs2', 'subscriber', 2, '2023-04-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`);
