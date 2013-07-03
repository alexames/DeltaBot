--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.ix_promotion_weight_thing_name;
DROP INDEX public.ix_promotion_weight_sr_name;
DROP INDEX public.ix_promotion_weight_promo_idx;
DROP INDEX public.ix_promotion_weight_date;
DROP INDEX public.ix_promotion_weight_account_id;
DROP INDEX public.ix_bids_thing_id;
DROP INDEX public.ix_bids_pay_id;
DROP INDEX public.ix_bids_account_id;
DROP INDEX public.idx_thing_id_reddit_data_subreddit;
DROP INDEX public.idx_thing_id_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_thing_id_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_thing_id_reddit_data_rel_trophy;
DROP INDEX public.idx_thing_id_reddit_data_rel_srmember;
DROP INDEX public.idx_thing_id_reddit_data_rel_savehide;
DROP INDEX public.idx_thing_id_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_thing_id_reddit_data_rel_report_account_message;
DROP INDEX public.idx_thing_id_reddit_data_rel_report_account_link;
DROP INDEX public.idx_thing_id_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_thing_id_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_thing_id_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_thing_id_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_thing_id_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_thing_id_reddit_data_rel_friend;
DROP INDEX public.idx_thing_id_reddit_data_rel_flair;
DROP INDEX public.idx_thing_id_reddit_data_rel_click;
DROP INDEX public.idx_thing_id_reddit_data_rel_adsr;
DROP INDEX public.idx_thing_id_reddit_data_promocampaign;
DROP INDEX public.idx_thing_id_reddit_data_message;
DROP INDEX public.idx_thing_id_reddit_data_link;
DROP INDEX public.idx_thing_id_reddit_data_comment;
DROP INDEX public.idx_thing_id_reddit_data_award;
DROP INDEX public.idx_thing_id_reddit_data_ad;
DROP INDEX public.idx_thing_id_reddit_data_account;
DROP INDEX public.idx_thing2_name_date_reddit_rel_vote_account_link;
DROP INDEX public.idx_thing2_name_date_reddit_rel_vote_account_comment;
DROP INDEX public.idx_thing2_name_date_reddit_rel_trophy;
DROP INDEX public.idx_thing2_name_date_reddit_rel_srmember;
DROP INDEX public.idx_thing2_name_date_reddit_rel_savehide;
DROP INDEX public.idx_thing2_name_date_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_thing2_name_date_reddit_rel_report_account_message;
DROP INDEX public.idx_thing2_name_date_reddit_rel_report_account_link;
DROP INDEX public.idx_thing2_name_date_reddit_rel_report_account_comment;
DROP INDEX public.idx_thing2_name_date_reddit_rel_moderatorinbox;
DROP INDEX public.idx_thing2_name_date_reddit_rel_jury_account_link;
DROP INDEX public.idx_thing2_name_date_reddit_rel_inbox_account_message;
DROP INDEX public.idx_thing2_name_date_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_thing2_name_date_reddit_rel_friend;
DROP INDEX public.idx_thing2_name_date_reddit_rel_flair;
DROP INDEX public.idx_thing2_name_date_reddit_rel_click;
DROP INDEX public.idx_thing2_name_date_reddit_rel_adsr;
DROP INDEX public.idx_thing2_id_reddit_rel_vote_account_link;
DROP INDEX public.idx_thing2_id_reddit_rel_vote_account_comment;
DROP INDEX public.idx_thing2_id_reddit_rel_trophy;
DROP INDEX public.idx_thing2_id_reddit_rel_srmember;
DROP INDEX public.idx_thing2_id_reddit_rel_savehide;
DROP INDEX public.idx_thing2_id_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_thing2_id_reddit_rel_report_account_message;
DROP INDEX public.idx_thing2_id_reddit_rel_report_account_link;
DROP INDEX public.idx_thing2_id_reddit_rel_report_account_comment;
DROP INDEX public.idx_thing2_id_reddit_rel_moderatorinbox;
DROP INDEX public.idx_thing2_id_reddit_rel_jury_account_link;
DROP INDEX public.idx_thing2_id_reddit_rel_inbox_account_message;
DROP INDEX public.idx_thing2_id_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_thing2_id_reddit_rel_friend;
DROP INDEX public.idx_thing2_id_reddit_rel_flair;
DROP INDEX public.idx_thing2_id_reddit_rel_click;
DROP INDEX public.idx_thing2_id_reddit_rel_adsr;
DROP INDEX public.idx_thing1_name_date_reddit_rel_vote_account_link;
DROP INDEX public.idx_thing1_name_date_reddit_rel_vote_account_comment;
DROP INDEX public.idx_thing1_name_date_reddit_rel_trophy;
DROP INDEX public.idx_thing1_name_date_reddit_rel_srmember;
DROP INDEX public.idx_thing1_name_date_reddit_rel_savehide;
DROP INDEX public.idx_thing1_name_date_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_thing1_name_date_reddit_rel_report_account_message;
DROP INDEX public.idx_thing1_name_date_reddit_rel_report_account_link;
DROP INDEX public.idx_thing1_name_date_reddit_rel_report_account_comment;
DROP INDEX public.idx_thing1_name_date_reddit_rel_moderatorinbox;
DROP INDEX public.idx_thing1_name_date_reddit_rel_jury_account_link;
DROP INDEX public.idx_thing1_name_date_reddit_rel_inbox_account_message;
DROP INDEX public.idx_thing1_name_date_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_thing1_name_date_reddit_rel_friend;
DROP INDEX public.idx_thing1_name_date_reddit_rel_flair;
DROP INDEX public.idx_thing1_name_date_reddit_rel_click;
DROP INDEX public.idx_thing1_name_date_reddit_rel_adsr;
DROP INDEX public.idx_thing1_id_reddit_rel_vote_account_link;
DROP INDEX public.idx_thing1_id_reddit_rel_vote_account_comment;
DROP INDEX public.idx_thing1_id_reddit_rel_trophy;
DROP INDEX public.idx_thing1_id_reddit_rel_srmember;
DROP INDEX public.idx_thing1_id_reddit_rel_savehide;
DROP INDEX public.idx_thing1_id_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_thing1_id_reddit_rel_report_account_message;
DROP INDEX public.idx_thing1_id_reddit_rel_report_account_link;
DROP INDEX public.idx_thing1_id_reddit_rel_report_account_comment;
DROP INDEX public.idx_thing1_id_reddit_rel_moderatorinbox;
DROP INDEX public.idx_thing1_id_reddit_rel_jury_account_link;
DROP INDEX public.idx_thing1_id_reddit_rel_inbox_account_message;
DROP INDEX public.idx_thing1_id_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_thing1_id_reddit_rel_friend;
DROP INDEX public.idx_thing1_id_reddit_rel_flair;
DROP INDEX public.idx_thing1_id_reddit_rel_click;
DROP INDEX public.idx_thing1_id_reddit_rel_adsr;
DROP INDEX public.idx_subscr_id_reddit_gold;
DROP INDEX public.idx_status_reddit_gold;
DROP INDEX public.idx_secret_reddit_gold;
DROP INDEX public.idx_score_reddit_thing_subreddit;
DROP INDEX public.idx_score_reddit_thing_promocampaign;
DROP INDEX public.idx_score_reddit_thing_message;
DROP INDEX public.idx_score_reddit_thing_link;
DROP INDEX public.idx_score_reddit_thing_comment;
DROP INDEX public.idx_score_reddit_thing_award;
DROP INDEX public.idx_score_reddit_thing_ad;
DROP INDEX public.idx_score_reddit_thing_account;
DROP INDEX public.idx_payer_email_reddit_gold;
DROP INDEX public.idx_name_reddit_rel_vote_account_link;
DROP INDEX public.idx_name_reddit_rel_vote_account_comment;
DROP INDEX public.idx_name_reddit_rel_trophy;
DROP INDEX public.idx_name_reddit_rel_srmember;
DROP INDEX public.idx_name_reddit_rel_savehide;
DROP INDEX public.idx_name_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_name_reddit_rel_report_account_message;
DROP INDEX public.idx_name_reddit_rel_report_account_link;
DROP INDEX public.idx_name_reddit_rel_report_account_comment;
DROP INDEX public.idx_name_reddit_rel_moderatorinbox;
DROP INDEX public.idx_name_reddit_rel_jury_account_link;
DROP INDEX public.idx_name_reddit_rel_inbox_account_message;
DROP INDEX public.idx_name_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_name_reddit_rel_friend;
DROP INDEX public.idx_name_reddit_rel_flair;
DROP INDEX public.idx_name_reddit_rel_click;
DROP INDEX public.idx_name_reddit_rel_adsr;
DROP INDEX public.idx_lower_key_value_reddit_data_subreddit;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_trophy;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_srmember;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_savehide;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_report_account_message;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_report_account_link;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_friend;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_flair;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_click;
DROP INDEX public.idx_lower_key_value_reddit_data_rel_adsr;
DROP INDEX public.idx_lower_key_value_reddit_data_promocampaign;
DROP INDEX public.idx_lower_key_value_reddit_data_message;
DROP INDEX public.idx_lower_key_value_reddit_data_link;
DROP INDEX public.idx_lower_key_value_reddit_data_comment;
DROP INDEX public.idx_lower_key_value_reddit_data_award;
DROP INDEX public.idx_lower_key_value_reddit_data_ad;
DROP INDEX public.idx_lower_key_value_reddit_data_account;
DROP INDEX public.idx_kind_reddit_mail_queue;
DROP INDEX public.idx_key_value_reddit_data_subreddit;
DROP INDEX public.idx_key_value_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_key_value_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_key_value_reddit_data_rel_trophy;
DROP INDEX public.idx_key_value_reddit_data_rel_srmember;
DROP INDEX public.idx_key_value_reddit_data_rel_savehide;
DROP INDEX public.idx_key_value_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_key_value_reddit_data_rel_report_account_message;
DROP INDEX public.idx_key_value_reddit_data_rel_report_account_link;
DROP INDEX public.idx_key_value_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_key_value_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_key_value_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_key_value_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_key_value_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_key_value_reddit_data_rel_friend;
DROP INDEX public.idx_key_value_reddit_data_rel_flair;
DROP INDEX public.idx_key_value_reddit_data_rel_click;
DROP INDEX public.idx_key_value_reddit_data_rel_adsr;
DROP INDEX public.idx_key_value_reddit_data_promocampaign;
DROP INDEX public.idx_key_value_reddit_data_message;
DROP INDEX public.idx_key_value_reddit_data_link;
DROP INDEX public.idx_key_value_reddit_data_comment;
DROP INDEX public.idx_key_value_reddit_data_award;
DROP INDEX public.idx_key_value_reddit_data_ad;
DROP INDEX public.idx_key_value_reddit_data_account;
DROP INDEX public.idx_ip_network_reddit_data_subreddit;
DROP INDEX public.idx_ip_network_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_ip_network_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_ip_network_reddit_data_rel_trophy;
DROP INDEX public.idx_ip_network_reddit_data_rel_srmember;
DROP INDEX public.idx_ip_network_reddit_data_rel_savehide;
DROP INDEX public.idx_ip_network_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_ip_network_reddit_data_rel_report_account_message;
DROP INDEX public.idx_ip_network_reddit_data_rel_report_account_link;
DROP INDEX public.idx_ip_network_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_ip_network_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_ip_network_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_ip_network_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_ip_network_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_ip_network_reddit_data_rel_friend;
DROP INDEX public.idx_ip_network_reddit_data_rel_flair;
DROP INDEX public.idx_ip_network_reddit_data_rel_click;
DROP INDEX public.idx_ip_network_reddit_data_rel_adsr;
DROP INDEX public.idx_ip_network_reddit_data_promocampaign;
DROP INDEX public.idx_ip_network_reddit_data_message;
DROP INDEX public.idx_ip_network_reddit_data_link;
DROP INDEX public.idx_ip_network_reddit_data_comment;
DROP INDEX public.idx_ip_network_reddit_data_award;
DROP INDEX public.idx_ip_network_reddit_data_ad;
DROP INDEX public.idx_ip_network_reddit_data_account;
DROP INDEX public.idx_id_reddit_thing_subreddit;
DROP INDEX public.idx_id_reddit_thing_promocampaign;
DROP INDEX public.idx_id_reddit_thing_message;
DROP INDEX public.idx_id_reddit_thing_link;
DROP INDEX public.idx_id_reddit_thing_comment;
DROP INDEX public.idx_id_reddit_thing_award;
DROP INDEX public.idx_id_reddit_thing_ad;
DROP INDEX public.idx_id_reddit_thing_account;
DROP INDEX public.idx_id_reddit_data_subreddit;
DROP INDEX public.idx_id_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_id_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_id_reddit_data_rel_trophy;
DROP INDEX public.idx_id_reddit_data_rel_srmember;
DROP INDEX public.idx_id_reddit_data_rel_savehide;
DROP INDEX public.idx_id_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_id_reddit_data_rel_report_account_message;
DROP INDEX public.idx_id_reddit_data_rel_report_account_link;
DROP INDEX public.idx_id_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_id_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_id_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_id_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_id_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_id_reddit_data_rel_friend;
DROP INDEX public.idx_id_reddit_data_rel_flair;
DROP INDEX public.idx_id_reddit_data_rel_click;
DROP INDEX public.idx_id_reddit_data_rel_adsr;
DROP INDEX public.idx_id_reddit_data_promocampaign;
DROP INDEX public.idx_id_reddit_data_message;
DROP INDEX public.idx_id_reddit_data_link;
DROP INDEX public.idx_id_reddit_data_comment;
DROP INDEX public.idx_id_reddit_data_award;
DROP INDEX public.idx_id_reddit_data_ad;
DROP INDEX public.idx_id_reddit_data_account;
DROP INDEX public.idx_hot_reddit_thing_subreddit;
DROP INDEX public.idx_hot_reddit_thing_promocampaign;
DROP INDEX public.idx_hot_reddit_thing_message;
DROP INDEX public.idx_hot_reddit_thing_link;
DROP INDEX public.idx_hot_reddit_thing_comment;
DROP INDEX public.idx_hot_reddit_thing_award;
DROP INDEX public.idx_hot_reddit_thing_ad;
DROP INDEX public.idx_hot_reddit_thing_account;
DROP INDEX public.idx_expiration_reddit_hardcache;
DROP INDEX public.idx_email_reddit_opt_out;
DROP INDEX public.idx_deleted_spam_reddit_thing_subreddit;
DROP INDEX public.idx_deleted_spam_reddit_thing_promocampaign;
DROP INDEX public.idx_deleted_spam_reddit_thing_message;
DROP INDEX public.idx_deleted_spam_reddit_thing_link;
DROP INDEX public.idx_deleted_spam_reddit_thing_comment;
DROP INDEX public.idx_deleted_spam_reddit_thing_award;
DROP INDEX public.idx_deleted_spam_reddit_thing_ad;
DROP INDEX public.idx_deleted_spam_reddit_thing_account;
DROP INDEX public.idx_date_reddit_thing_subreddit;
DROP INDEX public.idx_date_reddit_thing_promocampaign;
DROP INDEX public.idx_date_reddit_thing_message;
DROP INDEX public.idx_date_reddit_thing_link;
DROP INDEX public.idx_date_reddit_thing_comment;
DROP INDEX public.idx_date_reddit_thing_award;
DROP INDEX public.idx_date_reddit_thing_ad;
DROP INDEX public.idx_date_reddit_thing_account;
DROP INDEX public.idx_date_reddit_rel_vote_account_link;
DROP INDEX public.idx_date_reddit_rel_vote_account_comment;
DROP INDEX public.idx_date_reddit_rel_trophy;
DROP INDEX public.idx_date_reddit_rel_srmember;
DROP INDEX public.idx_date_reddit_rel_savehide;
DROP INDEX public.idx_date_reddit_rel_report_account_subreddit;
DROP INDEX public.idx_date_reddit_rel_report_account_message;
DROP INDEX public.idx_date_reddit_rel_report_account_link;
DROP INDEX public.idx_date_reddit_rel_report_account_comment;
DROP INDEX public.idx_date_reddit_rel_moderatorinbox;
DROP INDEX public.idx_date_reddit_rel_jury_account_link;
DROP INDEX public.idx_date_reddit_rel_inbox_account_message;
DROP INDEX public.idx_date_reddit_rel_inbox_account_comment;
DROP INDEX public.idx_date_reddit_rel_friend;
DROP INDEX public.idx_date_reddit_rel_flair;
DROP INDEX public.idx_date_reddit_rel_click;
DROP INDEX public.idx_date_reddit_rel_adsr;
DROP INDEX public.idx_date_reddit_mail_queue;
DROP INDEX public.idx_date_reddit_gold;
DROP INDEX public.idx_controversy_reddit_thing_subreddit;
DROP INDEX public.idx_controversy_reddit_thing_promocampaign;
DROP INDEX public.idx_controversy_reddit_thing_message;
DROP INDEX public.idx_controversy_reddit_thing_link;
DROP INDEX public.idx_controversy_reddit_thing_comment;
DROP INDEX public.idx_controversy_reddit_thing_award;
DROP INDEX public.idx_controversy_reddit_thing_ad;
DROP INDEX public.idx_controversy_reddit_thing_account;
DROP INDEX public.idx_base_url_reddit_data_subreddit;
DROP INDEX public.idx_base_url_reddit_data_rel_vote_account_link;
DROP INDEX public.idx_base_url_reddit_data_rel_vote_account_comment;
DROP INDEX public.idx_base_url_reddit_data_rel_trophy;
DROP INDEX public.idx_base_url_reddit_data_rel_srmember;
DROP INDEX public.idx_base_url_reddit_data_rel_savehide;
DROP INDEX public.idx_base_url_reddit_data_rel_report_account_subreddit;
DROP INDEX public.idx_base_url_reddit_data_rel_report_account_message;
DROP INDEX public.idx_base_url_reddit_data_rel_report_account_link;
DROP INDEX public.idx_base_url_reddit_data_rel_report_account_comment;
DROP INDEX public.idx_base_url_reddit_data_rel_moderatorinbox;
DROP INDEX public.idx_base_url_reddit_data_rel_jury_account_link;
DROP INDEX public.idx_base_url_reddit_data_rel_inbox_account_message;
DROP INDEX public.idx_base_url_reddit_data_rel_inbox_account_comment;
DROP INDEX public.idx_base_url_reddit_data_rel_friend;
DROP INDEX public.idx_base_url_reddit_data_rel_flair;
DROP INDEX public.idx_base_url_reddit_data_rel_click;
DROP INDEX public.idx_base_url_reddit_data_rel_adsr;
DROP INDEX public.idx_base_url_reddit_data_promocampaign;
DROP INDEX public.idx_base_url_reddit_data_message;
DROP INDEX public.idx_base_url_reddit_data_link;
DROP INDEX public.idx_base_url_reddit_data_comment;
DROP INDEX public.idx_base_url_reddit_data_award;
DROP INDEX public.idx_base_url_reddit_data_ad;
DROP INDEX public.idx_base_url_reddit_data_account;
DROP INDEX public.idx_account_id_reddit_gold;
ALTER TABLE ONLY public.traffic_thingtarget DROP CONSTRAINT traffic_thingtarget_pkey;
ALTER TABLE ONLY public.traffic_thing DROP CONSTRAINT traffic_thing_pkey;
ALTER TABLE ONLY public.traffic_subscriptions DROP CONSTRAINT traffic_subscriptions_pkey;
ALTER TABLE ONLY public.traffic_subreddits DROP CONSTRAINT traffic_subreddits_pkey;
ALTER TABLE ONLY public.traffic_srpaths DROP CONSTRAINT traffic_srpaths_pkey;
ALTER TABLE ONLY public.traffic_lang DROP CONSTRAINT traffic_lang_pkey;
ALTER TABLE ONLY public.traffic_clicktarget DROP CONSTRAINT traffic_clicktarget_pkey;
ALTER TABLE ONLY public.traffic_click DROP CONSTRAINT traffic_click_pkey;
ALTER TABLE ONLY public.traffic_aggregate DROP CONSTRAINT traffic_aggregate_pkey;
ALTER TABLE ONLY public.reddit_type_rel DROP CONSTRAINT reddit_type_rel_pkey;
ALTER TABLE ONLY public.reddit_type DROP CONSTRAINT reddit_type_pkey;
ALTER TABLE ONLY public.reddit_thing_subreddit DROP CONSTRAINT reddit_thing_subreddit_pkey;
ALTER TABLE ONLY public.reddit_thing_promocampaign DROP CONSTRAINT reddit_thing_promocampaign_pkey;
ALTER TABLE ONLY public.reddit_thing_message DROP CONSTRAINT reddit_thing_message_pkey;
ALTER TABLE ONLY public.reddit_thing_link DROP CONSTRAINT reddit_thing_link_pkey;
ALTER TABLE ONLY public.reddit_thing_comment DROP CONSTRAINT reddit_thing_comment_pkey;
ALTER TABLE ONLY public.reddit_thing_award DROP CONSTRAINT reddit_thing_award_pkey;
ALTER TABLE ONLY public.reddit_thing_ad DROP CONSTRAINT reddit_thing_ad_pkey;
ALTER TABLE ONLY public.reddit_thing_account DROP CONSTRAINT reddit_thing_account_pkey;
ALTER TABLE ONLY public.reddit_sent_mail DROP CONSTRAINT reddit_sent_mail_pkey;
ALTER TABLE ONLY public.reddit_rel_vote_account_link DROP CONSTRAINT reddit_rel_vote_account_link_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_vote_account_link DROP CONSTRAINT reddit_rel_vote_account_link_pkey;
ALTER TABLE ONLY public.reddit_rel_vote_account_comment DROP CONSTRAINT reddit_rel_vote_account_comment_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_vote_account_comment DROP CONSTRAINT reddit_rel_vote_account_comment_pkey;
ALTER TABLE ONLY public.reddit_rel_trophy DROP CONSTRAINT reddit_rel_trophy_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_trophy DROP CONSTRAINT reddit_rel_trophy_pkey;
ALTER TABLE ONLY public.reddit_rel_srmember DROP CONSTRAINT reddit_rel_srmember_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_srmember DROP CONSTRAINT reddit_rel_srmember_pkey;
ALTER TABLE ONLY public.reddit_rel_savehide DROP CONSTRAINT reddit_rel_savehide_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_savehide DROP CONSTRAINT reddit_rel_savehide_pkey;
ALTER TABLE ONLY public.reddit_rel_report_account_subreddit DROP CONSTRAINT reddit_rel_report_account_subreddit_pkey;
ALTER TABLE ONLY public.reddit_rel_report_account_subreddit DROP CONSTRAINT reddit_rel_report_account_subreddi_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_report_account_message DROP CONSTRAINT reddit_rel_report_account_message_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_report_account_message DROP CONSTRAINT reddit_rel_report_account_message_pkey;
ALTER TABLE ONLY public.reddit_rel_report_account_link DROP CONSTRAINT reddit_rel_report_account_link_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_report_account_link DROP CONSTRAINT reddit_rel_report_account_link_pkey;
ALTER TABLE ONLY public.reddit_rel_report_account_comment DROP CONSTRAINT reddit_rel_report_account_comment_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_report_account_comment DROP CONSTRAINT reddit_rel_report_account_comment_pkey;
ALTER TABLE ONLY public.reddit_rel_moderatorinbox DROP CONSTRAINT reddit_rel_moderatorinbox_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_moderatorinbox DROP CONSTRAINT reddit_rel_moderatorinbox_pkey;
ALTER TABLE ONLY public.reddit_rel_jury_account_link DROP CONSTRAINT reddit_rel_jury_account_link_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_jury_account_link DROP CONSTRAINT reddit_rel_jury_account_link_pkey;
ALTER TABLE ONLY public.reddit_rel_inbox_account_message DROP CONSTRAINT reddit_rel_inbox_account_message_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_inbox_account_message DROP CONSTRAINT reddit_rel_inbox_account_message_pkey;
ALTER TABLE ONLY public.reddit_rel_inbox_account_comment DROP CONSTRAINT reddit_rel_inbox_account_comment_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_inbox_account_comment DROP CONSTRAINT reddit_rel_inbox_account_comment_pkey;
ALTER TABLE ONLY public.reddit_rel_friend DROP CONSTRAINT reddit_rel_friend_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_friend DROP CONSTRAINT reddit_rel_friend_pkey;
ALTER TABLE ONLY public.reddit_rel_flair DROP CONSTRAINT reddit_rel_flair_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_flair DROP CONSTRAINT reddit_rel_flair_pkey;
ALTER TABLE ONLY public.reddit_rel_click DROP CONSTRAINT reddit_rel_click_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_click DROP CONSTRAINT reddit_rel_click_pkey;
ALTER TABLE ONLY public.reddit_rel_adsr DROP CONSTRAINT reddit_rel_adsr_thing1_id_thing2_id_name_key;
ALTER TABLE ONLY public.reddit_rel_adsr DROP CONSTRAINT reddit_rel_adsr_pkey;
ALTER TABLE ONLY public.reddit_reject_mail DROP CONSTRAINT reddit_reject_mail_pkey;
ALTER TABLE ONLY public.reddit_opt_out DROP CONSTRAINT reddit_opt_out_pkey;
ALTER TABLE ONLY public.reddit_mail_queue DROP CONSTRAINT reddit_mail_queue_pkey;
ALTER TABLE ONLY public.reddit_hardcache DROP CONSTRAINT reddit_hardcache_pkey;
ALTER TABLE ONLY public.reddit_gold DROP CONSTRAINT reddit_gold_pkey;
ALTER TABLE ONLY public.reddit_data_subreddit DROP CONSTRAINT reddit_data_subreddit_pkey;
ALTER TABLE ONLY public.reddit_data_rel_vote_account_link DROP CONSTRAINT reddit_data_rel_vote_account_link_pkey;
ALTER TABLE ONLY public.reddit_data_rel_vote_account_comment DROP CONSTRAINT reddit_data_rel_vote_account_comment_pkey;
ALTER TABLE ONLY public.reddit_data_rel_trophy DROP CONSTRAINT reddit_data_rel_trophy_pkey;
ALTER TABLE ONLY public.reddit_data_rel_srmember DROP CONSTRAINT reddit_data_rel_srmember_pkey;
ALTER TABLE ONLY public.reddit_data_rel_savehide DROP CONSTRAINT reddit_data_rel_savehide_pkey;
ALTER TABLE ONLY public.reddit_data_rel_report_account_subreddit DROP CONSTRAINT reddit_data_rel_report_account_subreddit_pkey;
ALTER TABLE ONLY public.reddit_data_rel_report_account_message DROP CONSTRAINT reddit_data_rel_report_account_message_pkey;
ALTER TABLE ONLY public.reddit_data_rel_report_account_link DROP CONSTRAINT reddit_data_rel_report_account_link_pkey;
ALTER TABLE ONLY public.reddit_data_rel_report_account_comment DROP CONSTRAINT reddit_data_rel_report_account_comment_pkey;
ALTER TABLE ONLY public.reddit_data_rel_moderatorinbox DROP CONSTRAINT reddit_data_rel_moderatorinbox_pkey;
ALTER TABLE ONLY public.reddit_data_rel_jury_account_link DROP CONSTRAINT reddit_data_rel_jury_account_link_pkey;
ALTER TABLE ONLY public.reddit_data_rel_inbox_account_message DROP CONSTRAINT reddit_data_rel_inbox_account_message_pkey;
ALTER TABLE ONLY public.reddit_data_rel_inbox_account_comment DROP CONSTRAINT reddit_data_rel_inbox_account_comment_pkey;
ALTER TABLE ONLY public.reddit_data_rel_friend DROP CONSTRAINT reddit_data_rel_friend_pkey;
ALTER TABLE ONLY public.reddit_data_rel_flair DROP CONSTRAINT reddit_data_rel_flair_pkey;
ALTER TABLE ONLY public.reddit_data_rel_click DROP CONSTRAINT reddit_data_rel_click_pkey;
ALTER TABLE ONLY public.reddit_data_rel_adsr DROP CONSTRAINT reddit_data_rel_adsr_pkey;
ALTER TABLE ONLY public.reddit_data_promocampaign DROP CONSTRAINT reddit_data_promocampaign_pkey;
ALTER TABLE ONLY public.reddit_data_message DROP CONSTRAINT reddit_data_message_pkey;
ALTER TABLE ONLY public.reddit_data_link DROP CONSTRAINT reddit_data_link_pkey;
ALTER TABLE ONLY public.reddit_data_comment DROP CONSTRAINT reddit_data_comment_pkey;
ALTER TABLE ONLY public.reddit_data_award DROP CONSTRAINT reddit_data_award_pkey;
ALTER TABLE ONLY public.reddit_data_ad DROP CONSTRAINT reddit_data_ad_pkey;
ALTER TABLE ONLY public.reddit_data_account DROP CONSTRAINT reddit_data_account_pkey;
ALTER TABLE ONLY public.promotion_weight DROP CONSTRAINT promotion_weight_pkey;
ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
ALTER TABLE ONLY public.authorize_ship_id DROP CONSTRAINT authorize_ship_id_pkey;
ALTER TABLE ONLY public.authorize_pay_id DROP CONSTRAINT authorize_pay_id_pkey;
ALTER TABLE ONLY public.authorize_account_id DROP CONSTRAINT authorize_account_id_pkey;
ALTER TABLE public.reddit_type_rel ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reddit_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reddit_thing_subreddit ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_promocampaign ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_message ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_link ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_comment ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_award ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_ad ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_thing_account ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_vote_account_link ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_vote_account_comment ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_trophy ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_srmember ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_savehide ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_report_account_subreddit ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_report_account_message ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_report_account_link ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_report_account_comment ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_moderatorinbox ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_jury_account_link ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_inbox_account_message ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_inbox_account_comment ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_friend ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_flair ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_click ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_rel_adsr ALTER COLUMN rel_id DROP DEFAULT;
ALTER TABLE public.reddit_data_subreddit ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_vote_account_link ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_vote_account_comment ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_trophy ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_srmember ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_savehide ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_report_account_subreddit ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_report_account_message ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_report_account_link ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_report_account_comment ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_moderatorinbox ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_jury_account_link ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_inbox_account_message ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_inbox_account_comment ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_friend ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_flair ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_click ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_rel_adsr ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_promocampaign ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_message ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_link ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_comment ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_award ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_ad ALTER COLUMN thing_id DROP DEFAULT;
ALTER TABLE public.reddit_data_account ALTER COLUMN thing_id DROP DEFAULT;
DROP TABLE public.traffic_thingtarget;
DROP TABLE public.traffic_thing;
DROP TABLE public.traffic_subscriptions;
DROP TABLE public.traffic_subreddits;
DROP TABLE public.traffic_srpaths;
DROP TABLE public.traffic_lang;
DROP TABLE public.traffic_clicktarget;
DROP TABLE public.traffic_click;
DROP TABLE public.traffic_aggregate;
DROP SEQUENCE public.reddit_type_rel_id_seq;
DROP TABLE public.reddit_type_rel;
DROP SEQUENCE public.reddit_type_id_seq;
DROP TABLE public.reddit_type;
DROP SEQUENCE public.reddit_thing_subreddit_thing_id_seq;
DROP TABLE public.reddit_thing_subreddit;
DROP SEQUENCE public.reddit_thing_promocampaign_thing_id_seq;
DROP TABLE public.reddit_thing_promocampaign;
DROP SEQUENCE public.reddit_thing_message_thing_id_seq;
DROP TABLE public.reddit_thing_message;
DROP SEQUENCE public.reddit_thing_link_thing_id_seq;
DROP TABLE public.reddit_thing_link;
DROP SEQUENCE public.reddit_thing_comment_thing_id_seq;
DROP TABLE public.reddit_thing_comment;
DROP SEQUENCE public.reddit_thing_award_thing_id_seq;
DROP TABLE public.reddit_thing_award;
DROP SEQUENCE public.reddit_thing_ad_thing_id_seq;
DROP TABLE public.reddit_thing_ad;
DROP SEQUENCE public.reddit_thing_account_thing_id_seq;
DROP TABLE public.reddit_thing_account;
DROP TABLE public.reddit_sent_mail;
DROP SEQUENCE public.reddit_rel_vote_account_link_rel_id_seq;
DROP TABLE public.reddit_rel_vote_account_link;
DROP SEQUENCE public.reddit_rel_vote_account_comment_rel_id_seq;
DROP TABLE public.reddit_rel_vote_account_comment;
DROP SEQUENCE public.reddit_rel_trophy_rel_id_seq;
DROP TABLE public.reddit_rel_trophy;
DROP SEQUENCE public.reddit_rel_srmember_rel_id_seq;
DROP TABLE public.reddit_rel_srmember;
DROP SEQUENCE public.reddit_rel_savehide_rel_id_seq;
DROP TABLE public.reddit_rel_savehide;
DROP SEQUENCE public.reddit_rel_report_account_subreddit_rel_id_seq;
DROP TABLE public.reddit_rel_report_account_subreddit;
DROP SEQUENCE public.reddit_rel_report_account_message_rel_id_seq;
DROP TABLE public.reddit_rel_report_account_message;
DROP SEQUENCE public.reddit_rel_report_account_link_rel_id_seq;
DROP TABLE public.reddit_rel_report_account_link;
DROP SEQUENCE public.reddit_rel_report_account_comment_rel_id_seq;
DROP TABLE public.reddit_rel_report_account_comment;
DROP SEQUENCE public.reddit_rel_moderatorinbox_rel_id_seq;
DROP TABLE public.reddit_rel_moderatorinbox;
DROP SEQUENCE public.reddit_rel_jury_account_link_rel_id_seq;
DROP TABLE public.reddit_rel_jury_account_link;
DROP SEQUENCE public.reddit_rel_inbox_account_message_rel_id_seq;
DROP TABLE public.reddit_rel_inbox_account_message;
DROP SEQUENCE public.reddit_rel_inbox_account_comment_rel_id_seq;
DROP TABLE public.reddit_rel_inbox_account_comment;
DROP SEQUENCE public.reddit_rel_friend_rel_id_seq;
DROP TABLE public.reddit_rel_friend;
DROP SEQUENCE public.reddit_rel_flair_rel_id_seq;
DROP TABLE public.reddit_rel_flair;
DROP SEQUENCE public.reddit_rel_click_rel_id_seq;
DROP TABLE public.reddit_rel_click;
DROP SEQUENCE public.reddit_rel_adsr_rel_id_seq;
DROP TABLE public.reddit_rel_adsr;
DROP TABLE public.reddit_reject_mail;
DROP TABLE public.reddit_opt_out;
DROP TABLE public.reddit_mail_queue;
DROP TABLE public.reddit_hardcache;
DROP TABLE public.reddit_gold;
DROP SEQUENCE public.reddit_data_subreddit_thing_id_seq;
DROP TABLE public.reddit_data_subreddit;
DROP SEQUENCE public.reddit_data_rel_vote_account_link_thing_id_seq;
DROP TABLE public.reddit_data_rel_vote_account_link;
DROP SEQUENCE public.reddit_data_rel_vote_account_comment_thing_id_seq;
DROP TABLE public.reddit_data_rel_vote_account_comment;
DROP SEQUENCE public.reddit_data_rel_trophy_thing_id_seq;
DROP TABLE public.reddit_data_rel_trophy;
DROP SEQUENCE public.reddit_data_rel_srmember_thing_id_seq;
DROP TABLE public.reddit_data_rel_srmember;
DROP SEQUENCE public.reddit_data_rel_savehide_thing_id_seq;
DROP TABLE public.reddit_data_rel_savehide;
DROP SEQUENCE public.reddit_data_rel_report_account_subreddit_thing_id_seq;
DROP TABLE public.reddit_data_rel_report_account_subreddit;
DROP SEQUENCE public.reddit_data_rel_report_account_message_thing_id_seq;
DROP TABLE public.reddit_data_rel_report_account_message;
DROP SEQUENCE public.reddit_data_rel_report_account_link_thing_id_seq;
DROP TABLE public.reddit_data_rel_report_account_link;
DROP SEQUENCE public.reddit_data_rel_report_account_comment_thing_id_seq;
DROP TABLE public.reddit_data_rel_report_account_comment;
DROP SEQUENCE public.reddit_data_rel_moderatorinbox_thing_id_seq;
DROP TABLE public.reddit_data_rel_moderatorinbox;
DROP SEQUENCE public.reddit_data_rel_jury_account_link_thing_id_seq;
DROP TABLE public.reddit_data_rel_jury_account_link;
DROP SEQUENCE public.reddit_data_rel_inbox_account_message_thing_id_seq;
DROP TABLE public.reddit_data_rel_inbox_account_message;
DROP SEQUENCE public.reddit_data_rel_inbox_account_comment_thing_id_seq;
DROP TABLE public.reddit_data_rel_inbox_account_comment;
DROP SEQUENCE public.reddit_data_rel_friend_thing_id_seq;
DROP TABLE public.reddit_data_rel_friend;
DROP SEQUENCE public.reddit_data_rel_flair_thing_id_seq;
DROP TABLE public.reddit_data_rel_flair;
DROP SEQUENCE public.reddit_data_rel_click_thing_id_seq;
DROP TABLE public.reddit_data_rel_click;
DROP SEQUENCE public.reddit_data_rel_adsr_thing_id_seq;
DROP TABLE public.reddit_data_rel_adsr;
DROP SEQUENCE public.reddit_data_promocampaign_thing_id_seq;
DROP TABLE public.reddit_data_promocampaign;
DROP SEQUENCE public.reddit_data_message_thing_id_seq;
DROP TABLE public.reddit_data_message;
DROP SEQUENCE public.reddit_data_link_thing_id_seq;
DROP TABLE public.reddit_data_link;
DROP SEQUENCE public.reddit_data_comment_thing_id_seq;
DROP TABLE public.reddit_data_comment;
DROP SEQUENCE public.reddit_data_award_thing_id_seq;
DROP TABLE public.reddit_data_award;
DROP SEQUENCE public.reddit_data_ad_thing_id_seq;
DROP TABLE public.reddit_data_ad;
DROP SEQUENCE public.reddit_data_account_thing_id_seq;
DROP TABLE public.reddit_data_account;
DROP SEQUENCE public.queue_id_seq;
DROP TABLE public.promotion_weight;
DROP TABLE public.bids;
DROP TABLE public.authorize_ship_id;
DROP TABLE public.authorize_pay_id;
DROP TABLE public.authorize_account_id;
DROP VIEW public.active;
DROP FUNCTION public.score(ups integer, downs integer);
DROP FUNCTION public.ip_network(ip text);
DROP FUNCTION public.hot(ups integer, downs integer, date timestamp with time zone);
DROP FUNCTION public.domain(url text);
DROP FUNCTION public.controversy(ups integer, downs integer);
DROP FUNCTION public.base_url(url text);
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: base_url(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION base_url(url text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select substring($1 from E'(?i)(?:.+?://)?(?:www[\\d]*\\.)?([^#]*[^#/])/?')
$_$;


ALTER FUNCTION public.base_url(url text) OWNER TO postgres;

--
-- Name: controversy(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION controversy(ups integer, downs integer) RETURNS double precision
    LANGUAGE sql IMMUTABLE
    AS $_$
    select cast(($1 + $2) as float)/(abs($1 - $2)+1)
$_$;


ALTER FUNCTION public.controversy(ups integer, downs integer) OWNER TO postgres;

--
-- Name: domain(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION domain(url text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select substring($1 from E'(?i)(?:.+?://)?(?:www[\\d]*\\.)?([^#/]*)/?')
$_$;


ALTER FUNCTION public.domain(url text) OWNER TO postgres;

--
-- Name: hot(integer, integer, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hot(ups integer, downs integer, date timestamp with time zone) RETURNS numeric
    LANGUAGE sql IMMUTABLE
    AS $_$
    select round(cast(log(greatest(abs($1 - $2), 1)) + sign($1 - $2) * (date_part('epoch', $3) - 1134028003) / 45000.0 as numeric), 7)
$_$;


ALTER FUNCTION public.hot(ups integer, downs integer, date timestamp with time zone) OWNER TO postgres;

--
-- Name: ip_network(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ip_network(ip text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    select substring($1 from E'[\\d]+\.[\\d]+\.[\\d]+')
$_$;


ALTER FUNCTION public.ip_network(ip text) OWNER TO postgres;

--
-- Name: score(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION score(ups integer, downs integer) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$
    select $1 - $2
$_$;


ALTER FUNCTION public.score(ups integer, downs integer) OWNER TO postgres;

--
-- Name: active; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW active AS
    SELECT pg_stat_activity.procpid, (now() - pg_stat_activity.query_start) AS t, pg_stat_activity.current_query FROM pg_stat_activity WHERE (pg_stat_activity.current_query <> '<IDLE>'::text) ORDER BY (now() - pg_stat_activity.query_start);


ALTER TABLE public.active OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authorize_account_id; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE authorize_account_id (
    account_id bigint NOT NULL,
    authorize_id bigint
);


ALTER TABLE public.authorize_account_id OWNER TO reddit;

--
-- Name: authorize_pay_id; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE authorize_pay_id (
    account_id bigint NOT NULL,
    pay_id bigint NOT NULL
);


ALTER TABLE public.authorize_pay_id OWNER TO reddit;

--
-- Name: authorize_ship_id; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE authorize_ship_id (
    account_id bigint NOT NULL,
    ship_id bigint NOT NULL
);


ALTER TABLE public.authorize_ship_id OWNER TO reddit;

--
-- Name: bids; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE bids (
    transaction bigint NOT NULL,
    account_id bigint NOT NULL,
    pay_id bigint NOT NULL,
    thing_id bigint NOT NULL,
    ip inet,
    date timestamp with time zone NOT NULL,
    bid double precision NOT NULL,
    charge double precision,
    status integer NOT NULL,
    campaign integer NOT NULL
);


ALTER TABLE public.bids OWNER TO reddit;

--
-- Name: promotion_weight; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE promotion_weight (
    thing_name character varying NOT NULL,
    promo_idx bigint NOT NULL,
    sr_name character varying NOT NULL,
    date date NOT NULL,
    account_id bigint,
    bid double precision NOT NULL,
    weight double precision NOT NULL,
    finished boolean
);


ALTER TABLE public.promotion_weight OWNER TO reddit;

--
-- Name: queue_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queue_id_seq OWNER TO reddit;

--
-- Name: reddit_data_account; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_account (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_account OWNER TO reddit;

--
-- Name: reddit_data_account_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_account_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_account_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_account_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_account_thing_id_seq OWNED BY reddit_data_account.thing_id;


--
-- Name: reddit_data_ad; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_ad (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_ad OWNER TO reddit;

--
-- Name: reddit_data_ad_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_ad_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_ad_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_ad_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_ad_thing_id_seq OWNED BY reddit_data_ad.thing_id;


--
-- Name: reddit_data_award; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_award (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_award OWNER TO reddit;

--
-- Name: reddit_data_award_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_award_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_award_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_award_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_award_thing_id_seq OWNED BY reddit_data_award.thing_id;


--
-- Name: reddit_data_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_comment (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_comment OWNER TO reddit;

--
-- Name: reddit_data_comment_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_comment_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_comment_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_comment_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_comment_thing_id_seq OWNED BY reddit_data_comment.thing_id;


--
-- Name: reddit_data_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_link (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_link OWNER TO reddit;

--
-- Name: reddit_data_link_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_link_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_link_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_link_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_link_thing_id_seq OWNED BY reddit_data_link.thing_id;


--
-- Name: reddit_data_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_message (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_message OWNER TO reddit;

--
-- Name: reddit_data_message_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_message_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_message_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_message_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_message_thing_id_seq OWNED BY reddit_data_message.thing_id;


--
-- Name: reddit_data_promocampaign; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_promocampaign (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_promocampaign OWNER TO reddit;

--
-- Name: reddit_data_promocampaign_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_promocampaign_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_promocampaign_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_promocampaign_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_promocampaign_thing_id_seq OWNED BY reddit_data_promocampaign.thing_id;


--
-- Name: reddit_data_rel_adsr; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_adsr (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_adsr OWNER TO reddit;

--
-- Name: reddit_data_rel_adsr_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_adsr_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_adsr_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_adsr_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_adsr_thing_id_seq OWNED BY reddit_data_rel_adsr.thing_id;


--
-- Name: reddit_data_rel_click; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_click (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_click OWNER TO reddit;

--
-- Name: reddit_data_rel_click_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_click_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_click_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_click_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_click_thing_id_seq OWNED BY reddit_data_rel_click.thing_id;


--
-- Name: reddit_data_rel_flair; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_flair (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_flair OWNER TO reddit;

--
-- Name: reddit_data_rel_flair_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_flair_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_flair_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_flair_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_flair_thing_id_seq OWNED BY reddit_data_rel_flair.thing_id;


--
-- Name: reddit_data_rel_friend; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_friend (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_friend OWNER TO reddit;

--
-- Name: reddit_data_rel_friend_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_friend_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_friend_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_friend_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_friend_thing_id_seq OWNED BY reddit_data_rel_friend.thing_id;


--
-- Name: reddit_data_rel_inbox_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_inbox_account_comment (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_inbox_account_comment OWNER TO reddit;

--
-- Name: reddit_data_rel_inbox_account_comment_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_inbox_account_comment_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_inbox_account_comment_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_inbox_account_comment_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_inbox_account_comment_thing_id_seq OWNED BY reddit_data_rel_inbox_account_comment.thing_id;


--
-- Name: reddit_data_rel_inbox_account_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_inbox_account_message (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_inbox_account_message OWNER TO reddit;

--
-- Name: reddit_data_rel_inbox_account_message_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_inbox_account_message_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_inbox_account_message_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_inbox_account_message_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_inbox_account_message_thing_id_seq OWNED BY reddit_data_rel_inbox_account_message.thing_id;


--
-- Name: reddit_data_rel_jury_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_jury_account_link (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_jury_account_link OWNER TO reddit;

--
-- Name: reddit_data_rel_jury_account_link_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_jury_account_link_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_jury_account_link_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_jury_account_link_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_jury_account_link_thing_id_seq OWNED BY reddit_data_rel_jury_account_link.thing_id;


--
-- Name: reddit_data_rel_moderatorinbox; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_moderatorinbox (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_moderatorinbox OWNER TO reddit;

--
-- Name: reddit_data_rel_moderatorinbox_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_moderatorinbox_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_moderatorinbox_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_moderatorinbox_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_moderatorinbox_thing_id_seq OWNED BY reddit_data_rel_moderatorinbox.thing_id;


--
-- Name: reddit_data_rel_report_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_report_account_comment (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_report_account_comment OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_comment_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_report_account_comment_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_report_account_comment_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_comment_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_report_account_comment_thing_id_seq OWNED BY reddit_data_rel_report_account_comment.thing_id;


--
-- Name: reddit_data_rel_report_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_report_account_link (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_report_account_link OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_link_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_report_account_link_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_report_account_link_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_link_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_report_account_link_thing_id_seq OWNED BY reddit_data_rel_report_account_link.thing_id;


--
-- Name: reddit_data_rel_report_account_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_report_account_message (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_report_account_message OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_message_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_report_account_message_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_report_account_message_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_message_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_report_account_message_thing_id_seq OWNED BY reddit_data_rel_report_account_message.thing_id;


--
-- Name: reddit_data_rel_report_account_subreddit; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_report_account_subreddit (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_report_account_subreddit OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_subreddit_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_report_account_subreddit_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_report_account_subreddit_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_report_account_subreddit_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_report_account_subreddit_thing_id_seq OWNED BY reddit_data_rel_report_account_subreddit.thing_id;


--
-- Name: reddit_data_rel_savehide; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_savehide (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_savehide OWNER TO reddit;

--
-- Name: reddit_data_rel_savehide_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_savehide_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_savehide_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_savehide_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_savehide_thing_id_seq OWNED BY reddit_data_rel_savehide.thing_id;


--
-- Name: reddit_data_rel_srmember; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_srmember (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_srmember OWNER TO reddit;

--
-- Name: reddit_data_rel_srmember_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_srmember_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_srmember_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_srmember_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_srmember_thing_id_seq OWNED BY reddit_data_rel_srmember.thing_id;


--
-- Name: reddit_data_rel_trophy; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_trophy (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_trophy OWNER TO reddit;

--
-- Name: reddit_data_rel_trophy_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_trophy_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_trophy_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_trophy_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_trophy_thing_id_seq OWNED BY reddit_data_rel_trophy.thing_id;


--
-- Name: reddit_data_rel_vote_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_vote_account_comment (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_vote_account_comment OWNER TO reddit;

--
-- Name: reddit_data_rel_vote_account_comment_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_vote_account_comment_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_vote_account_comment_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_vote_account_comment_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_vote_account_comment_thing_id_seq OWNED BY reddit_data_rel_vote_account_comment.thing_id;


--
-- Name: reddit_data_rel_vote_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_rel_vote_account_link (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_rel_vote_account_link OWNER TO reddit;

--
-- Name: reddit_data_rel_vote_account_link_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_rel_vote_account_link_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_rel_vote_account_link_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_rel_vote_account_link_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_rel_vote_account_link_thing_id_seq OWNED BY reddit_data_rel_vote_account_link.thing_id;


--
-- Name: reddit_data_subreddit; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_data_subreddit (
    thing_id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying,
    kind character varying
);


ALTER TABLE public.reddit_data_subreddit OWNER TO reddit;

--
-- Name: reddit_data_subreddit_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_data_subreddit_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_data_subreddit_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_data_subreddit_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_data_subreddit_thing_id_seq OWNED BY reddit_data_subreddit.thing_id;


--
-- Name: reddit_gold; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_gold (
    trans_id character varying NOT NULL,
    status character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    payer_email character varying NOT NULL,
    paying_id character varying NOT NULL,
    pennies integer NOT NULL,
    secret character varying,
    account_id character varying,
    days integer,
    subscr_id character varying
);


ALTER TABLE public.reddit_gold OWNER TO reddit;

--
-- Name: reddit_hardcache; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_hardcache (
    category character varying NOT NULL,
    ids character varying NOT NULL,
    value character varying NOT NULL,
    kind character varying NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_hardcache OWNER TO reddit;

--
-- Name: reddit_mail_queue; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_mail_queue (
    uid integer NOT NULL,
    msg_hash character varying,
    account_id bigint,
    from_name character varying,
    to_addr character varying,
    fr_addr character varying,
    reply_to character varying,
    fullname character varying,
    date timestamp with time zone NOT NULL,
    ip inet,
    kind integer,
    body character varying
);


ALTER TABLE public.reddit_mail_queue OWNER TO reddit;

--
-- Name: reddit_opt_out; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_opt_out (
    email character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    msg_hash character varying
);


ALTER TABLE public.reddit_opt_out OWNER TO reddit;

--
-- Name: reddit_reject_mail; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_reject_mail (
    msg_hash character varying NOT NULL,
    account_id bigint,
    to_addr character varying,
    fr_addr character varying,
    reply_to character varying,
    ip inet,
    fullname character varying,
    date timestamp with time zone NOT NULL,
    kind integer
);


ALTER TABLE public.reddit_reject_mail OWNER TO reddit;

--
-- Name: reddit_rel_adsr; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_adsr (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_adsr OWNER TO reddit;

--
-- Name: reddit_rel_adsr_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_adsr_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_adsr_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_adsr_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_adsr_rel_id_seq OWNED BY reddit_rel_adsr.rel_id;


--
-- Name: reddit_rel_click; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_click (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_click OWNER TO reddit;

--
-- Name: reddit_rel_click_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_click_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_click_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_click_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_click_rel_id_seq OWNED BY reddit_rel_click.rel_id;


--
-- Name: reddit_rel_flair; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_flair (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_flair OWNER TO reddit;

--
-- Name: reddit_rel_flair_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_flair_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_flair_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_flair_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_flair_rel_id_seq OWNED BY reddit_rel_flair.rel_id;


--
-- Name: reddit_rel_friend; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_friend (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_friend OWNER TO reddit;

--
-- Name: reddit_rel_friend_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_friend_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_friend_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_friend_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_friend_rel_id_seq OWNED BY reddit_rel_friend.rel_id;


--
-- Name: reddit_rel_inbox_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_inbox_account_comment (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_inbox_account_comment OWNER TO reddit;

--
-- Name: reddit_rel_inbox_account_comment_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_inbox_account_comment_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_inbox_account_comment_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_inbox_account_comment_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_inbox_account_comment_rel_id_seq OWNED BY reddit_rel_inbox_account_comment.rel_id;


--
-- Name: reddit_rel_inbox_account_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_inbox_account_message (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_inbox_account_message OWNER TO reddit;

--
-- Name: reddit_rel_inbox_account_message_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_inbox_account_message_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_inbox_account_message_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_inbox_account_message_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_inbox_account_message_rel_id_seq OWNED BY reddit_rel_inbox_account_message.rel_id;


--
-- Name: reddit_rel_jury_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_jury_account_link (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_jury_account_link OWNER TO reddit;

--
-- Name: reddit_rel_jury_account_link_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_jury_account_link_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_jury_account_link_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_jury_account_link_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_jury_account_link_rel_id_seq OWNED BY reddit_rel_jury_account_link.rel_id;


--
-- Name: reddit_rel_moderatorinbox; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_moderatorinbox (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_moderatorinbox OWNER TO reddit;

--
-- Name: reddit_rel_moderatorinbox_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_moderatorinbox_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_moderatorinbox_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_moderatorinbox_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_moderatorinbox_rel_id_seq OWNED BY reddit_rel_moderatorinbox.rel_id;


--
-- Name: reddit_rel_report_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_report_account_comment (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_report_account_comment OWNER TO reddit;

--
-- Name: reddit_rel_report_account_comment_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_report_account_comment_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_report_account_comment_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_report_account_comment_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_report_account_comment_rel_id_seq OWNED BY reddit_rel_report_account_comment.rel_id;


--
-- Name: reddit_rel_report_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_report_account_link (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_report_account_link OWNER TO reddit;

--
-- Name: reddit_rel_report_account_link_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_report_account_link_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_report_account_link_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_report_account_link_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_report_account_link_rel_id_seq OWNED BY reddit_rel_report_account_link.rel_id;


--
-- Name: reddit_rel_report_account_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_report_account_message (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_report_account_message OWNER TO reddit;

--
-- Name: reddit_rel_report_account_message_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_report_account_message_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_report_account_message_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_report_account_message_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_report_account_message_rel_id_seq OWNED BY reddit_rel_report_account_message.rel_id;


--
-- Name: reddit_rel_report_account_subreddit; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_report_account_subreddit (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_report_account_subreddit OWNER TO reddit;

--
-- Name: reddit_rel_report_account_subreddit_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_report_account_subreddit_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_report_account_subreddit_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_report_account_subreddit_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_report_account_subreddit_rel_id_seq OWNED BY reddit_rel_report_account_subreddit.rel_id;


--
-- Name: reddit_rel_savehide; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_savehide (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_savehide OWNER TO reddit;

--
-- Name: reddit_rel_savehide_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_savehide_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_savehide_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_savehide_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_savehide_rel_id_seq OWNED BY reddit_rel_savehide.rel_id;


--
-- Name: reddit_rel_srmember; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_srmember (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_srmember OWNER TO reddit;

--
-- Name: reddit_rel_srmember_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_srmember_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_srmember_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_srmember_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_srmember_rel_id_seq OWNED BY reddit_rel_srmember.rel_id;


--
-- Name: reddit_rel_trophy; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_trophy (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_trophy OWNER TO reddit;

--
-- Name: reddit_rel_trophy_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_trophy_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_trophy_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_trophy_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_trophy_rel_id_seq OWNED BY reddit_rel_trophy.rel_id;


--
-- Name: reddit_rel_vote_account_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_vote_account_comment (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_vote_account_comment OWNER TO reddit;

--
-- Name: reddit_rel_vote_account_comment_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_vote_account_comment_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_vote_account_comment_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_vote_account_comment_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_vote_account_comment_rel_id_seq OWNED BY reddit_rel_vote_account_comment.rel_id;


--
-- Name: reddit_rel_vote_account_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_rel_vote_account_link (
    rel_id bigint NOT NULL,
    thing1_id bigint NOT NULL,
    thing2_id bigint NOT NULL,
    name character varying NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_rel_vote_account_link OWNER TO reddit;

--
-- Name: reddit_rel_vote_account_link_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_rel_vote_account_link_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_rel_vote_account_link_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_rel_vote_account_link_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_rel_vote_account_link_rel_id_seq OWNED BY reddit_rel_vote_account_link.rel_id;


--
-- Name: reddit_sent_mail; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_sent_mail (
    msg_hash character varying NOT NULL,
    account_id bigint,
    to_addr character varying,
    fr_addr character varying,
    reply_to character varying,
    ip inet,
    fullname character varying,
    date timestamp with time zone NOT NULL,
    kind integer
);


ALTER TABLE public.reddit_sent_mail OWNER TO reddit;

--
-- Name: reddit_thing_account; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_account (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_account OWNER TO reddit;

--
-- Name: reddit_thing_account_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_account_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_account_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_account_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_account_thing_id_seq OWNED BY reddit_thing_account.thing_id;


--
-- Name: reddit_thing_ad; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_ad (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_ad OWNER TO reddit;

--
-- Name: reddit_thing_ad_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_ad_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_ad_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_ad_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_ad_thing_id_seq OWNED BY reddit_thing_ad.thing_id;


--
-- Name: reddit_thing_award; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_award (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_award OWNER TO reddit;

--
-- Name: reddit_thing_award_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_award_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_award_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_award_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_award_thing_id_seq OWNED BY reddit_thing_award.thing_id;


--
-- Name: reddit_thing_comment; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_comment (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_comment OWNER TO reddit;

--
-- Name: reddit_thing_comment_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_comment_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_comment_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_comment_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_comment_thing_id_seq OWNED BY reddit_thing_comment.thing_id;


--
-- Name: reddit_thing_link; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_link (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_link OWNER TO reddit;

--
-- Name: reddit_thing_link_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_link_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_link_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_link_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_link_thing_id_seq OWNED BY reddit_thing_link.thing_id;


--
-- Name: reddit_thing_message; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_message (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_message OWNER TO reddit;

--
-- Name: reddit_thing_message_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_message_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_message_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_message_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_message_thing_id_seq OWNED BY reddit_thing_message.thing_id;


--
-- Name: reddit_thing_promocampaign; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_promocampaign (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_promocampaign OWNER TO reddit;

--
-- Name: reddit_thing_promocampaign_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_promocampaign_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_promocampaign_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_promocampaign_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_promocampaign_thing_id_seq OWNED BY reddit_thing_promocampaign.thing_id;


--
-- Name: reddit_thing_subreddit; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_thing_subreddit (
    thing_id bigint NOT NULL,
    ups integer NOT NULL,
    downs integer NOT NULL,
    deleted boolean NOT NULL,
    spam boolean NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.reddit_thing_subreddit OWNER TO reddit;

--
-- Name: reddit_thing_subreddit_thing_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_thing_subreddit_thing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_thing_subreddit_thing_id_seq OWNER TO reddit;

--
-- Name: reddit_thing_subreddit_thing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_thing_subreddit_thing_id_seq OWNED BY reddit_thing_subreddit.thing_id;


--
-- Name: reddit_type; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.reddit_type OWNER TO reddit;

--
-- Name: reddit_type_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_type_id_seq OWNER TO reddit;

--
-- Name: reddit_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_type_id_seq OWNED BY reddit_type.id;


--
-- Name: reddit_type_rel; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE reddit_type_rel (
    id integer NOT NULL,
    type1_id integer NOT NULL,
    type2_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.reddit_type_rel OWNER TO reddit;

--
-- Name: reddit_type_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: reddit
--

CREATE SEQUENCE reddit_type_rel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reddit_type_rel_id_seq OWNER TO reddit;

--
-- Name: reddit_type_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddit
--

ALTER SEQUENCE reddit_type_rel_id_seq OWNED BY reddit_type_rel.id;


--
-- Name: traffic_aggregate; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_aggregate (
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total bigint
);


ALTER TABLE public.traffic_aggregate OWNER TO reddit;

--
-- Name: traffic_click; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_click (
    fullname character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total integer
);


ALTER TABLE public.traffic_click OWNER TO reddit;

--
-- Name: traffic_clicktarget; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_clicktarget (
    fullname character varying NOT NULL,
    subreddit character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total integer
);


ALTER TABLE public.traffic_clicktarget OWNER TO reddit;

--
-- Name: traffic_lang; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_lang (
    lang character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total bigint
);


ALTER TABLE public.traffic_lang OWNER TO reddit;

--
-- Name: traffic_srpaths; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_srpaths (
    srpath character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total integer
);


ALTER TABLE public.traffic_srpaths OWNER TO reddit;

--
-- Name: traffic_subreddits; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_subreddits (
    subreddit character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total integer
);


ALTER TABLE public.traffic_subreddits OWNER TO reddit;

--
-- Name: traffic_subscriptions; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_subscriptions (
    subreddit character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "unique" integer
);


ALTER TABLE public.traffic_subscriptions OWNER TO reddit;

--
-- Name: traffic_thing; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_thing (
    fullname character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total bigint
);


ALTER TABLE public.traffic_thing OWNER TO reddit;

--
-- Name: traffic_thingtarget; Type: TABLE; Schema: public; Owner: reddit; Tablespace: 
--

CREATE TABLE traffic_thingtarget (
    fullname character varying NOT NULL,
    subreddit character varying NOT NULL,
    date timestamp without time zone NOT NULL,
    "interval" character varying NOT NULL,
    "unique" integer,
    total integer
);


ALTER TABLE public.traffic_thingtarget OWNER TO reddit;

--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_account ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_account_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_ad ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_ad_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_award ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_award_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_comment ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_comment_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_link ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_link_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_message ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_message_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_promocampaign ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_promocampaign_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_adsr ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_adsr_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_click ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_click_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_flair ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_flair_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_friend ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_friend_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_inbox_account_comment ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_inbox_account_comment_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_inbox_account_message ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_inbox_account_message_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_jury_account_link ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_jury_account_link_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_moderatorinbox ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_moderatorinbox_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_report_account_comment ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_report_account_comment_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_report_account_link ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_report_account_link_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_report_account_message ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_report_account_message_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_report_account_subreddit ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_report_account_subreddit_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_savehide ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_savehide_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_srmember ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_srmember_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_trophy ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_trophy_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_vote_account_comment ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_vote_account_comment_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_rel_vote_account_link ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_rel_vote_account_link_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_data_subreddit ALTER COLUMN thing_id SET DEFAULT nextval('reddit_data_subreddit_thing_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_adsr ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_adsr_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_click ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_click_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_flair ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_flair_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_friend ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_friend_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_inbox_account_comment ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_inbox_account_comment_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_inbox_account_message ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_inbox_account_message_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_jury_account_link ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_jury_account_link_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_moderatorinbox ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_moderatorinbox_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_report_account_comment ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_report_account_comment_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_report_account_link ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_report_account_link_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_report_account_message ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_report_account_message_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_report_account_subreddit ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_report_account_subreddit_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_savehide ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_savehide_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_srmember ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_srmember_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_trophy ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_trophy_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_vote_account_comment ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_vote_account_comment_rel_id_seq'::regclass);


--
-- Name: rel_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_rel_vote_account_link ALTER COLUMN rel_id SET DEFAULT nextval('reddit_rel_vote_account_link_rel_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_account ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_account_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_ad ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_ad_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_award ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_award_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_comment ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_comment_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_link ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_link_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_message ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_message_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_promocampaign ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_promocampaign_thing_id_seq'::regclass);


--
-- Name: thing_id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_thing_subreddit ALTER COLUMN thing_id SET DEFAULT nextval('reddit_thing_subreddit_thing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_type ALTER COLUMN id SET DEFAULT nextval('reddit_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: reddit
--

ALTER TABLE ONLY reddit_type_rel ALTER COLUMN id SET DEFAULT nextval('reddit_type_rel_id_seq'::regclass);


--
-- Data for Name: authorize_account_id; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY authorize_account_id (account_id, authorize_id) FROM stdin;
\.


--
-- Data for Name: authorize_pay_id; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY authorize_pay_id (account_id, pay_id) FROM stdin;
\.


--
-- Data for Name: authorize_ship_id; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY authorize_ship_id (account_id, ship_id) FROM stdin;
\.


--
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY bids (transaction, account_id, pay_id, thing_id, ip, date, bid, charge, status, campaign) FROM stdin;
\.


--
-- Data for Name: promotion_weight; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY promotion_weight (thing_name, promo_idx, sr_name, date, account_id, bid, weight, finished) FROM stdin;
\.


--
-- Name: queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('queue_id_seq', 1, false);


--
-- Data for Name: reddit_data_account; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_account (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_account_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_account_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_ad; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_ad (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_ad_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_ad_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_award; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_award (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_award_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_award_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_comment (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_comment_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_comment_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_link (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_link_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_link_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_message (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_message_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_message_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_promocampaign; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_promocampaign (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_promocampaign_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_promocampaign_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_adsr; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_adsr (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_adsr_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_adsr_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_click; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_click (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_click_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_click_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_flair; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_flair (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_flair_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_flair_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_friend; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_friend (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_friend_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_friend_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_inbox_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_inbox_account_comment (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_inbox_account_comment_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_inbox_account_comment_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_inbox_account_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_inbox_account_message (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_inbox_account_message_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_inbox_account_message_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_jury_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_jury_account_link (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_jury_account_link_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_jury_account_link_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_moderatorinbox; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_moderatorinbox (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_moderatorinbox_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_moderatorinbox_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_report_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_report_account_comment (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_report_account_comment_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_report_account_comment_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_report_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_report_account_link (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_report_account_link_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_report_account_link_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_report_account_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_report_account_message (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_report_account_message_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_report_account_message_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_report_account_subreddit; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_report_account_subreddit (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_report_account_subreddit_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_report_account_subreddit_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_savehide; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_savehide (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_savehide_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_savehide_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_srmember; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_srmember (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_srmember_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_srmember_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_trophy; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_trophy (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_trophy_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_trophy_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_vote_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_vote_account_comment (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_vote_account_comment_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_vote_account_comment_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_rel_vote_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_rel_vote_account_link (thing_id, key, value, kind) FROM stdin;
\.


--
-- Name: reddit_data_rel_vote_account_link_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_rel_vote_account_link_thing_id_seq', 1, false);


--
-- Data for Name: reddit_data_subreddit; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_data_subreddit (thing_id, key, value, kind) FROM stdin;
1	lang	en	str
1	name	promos	str
1	title	promoted links	str
1	ip	0.0.0.0	str
1	allow_top	t	bool
1	author_id	-1	num
1	type	public	str
\.


--
-- Name: reddit_data_subreddit_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_data_subreddit_thing_id_seq', 1, false);


--
-- Data for Name: reddit_gold; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_gold (trans_id, status, date, payer_email, paying_id, pennies, secret, account_id, days, subscr_id) FROM stdin;
\.


--
-- Data for Name: reddit_hardcache; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_hardcache (category, ids, value, kind, expiration) FROM stdin;
\.


--
-- Data for Name: reddit_mail_queue; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_mail_queue (uid, msg_hash, account_id, from_name, to_addr, fr_addr, reply_to, fullname, date, ip, kind, body) FROM stdin;
\.


--
-- Data for Name: reddit_opt_out; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_opt_out (email, date, msg_hash) FROM stdin;
\.


--
-- Data for Name: reddit_reject_mail; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_reject_mail (msg_hash, account_id, to_addr, fr_addr, reply_to, ip, fullname, date, kind) FROM stdin;
\.


--
-- Data for Name: reddit_rel_adsr; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_adsr (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_adsr_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_adsr_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_click; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_click (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_click_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_click_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_flair; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_flair (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_flair_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_flair_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_friend; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_friend (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_friend_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_friend_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_inbox_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_inbox_account_comment (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_inbox_account_comment_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_inbox_account_comment_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_inbox_account_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_inbox_account_message (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_inbox_account_message_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_inbox_account_message_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_jury_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_jury_account_link (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_jury_account_link_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_jury_account_link_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_moderatorinbox; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_moderatorinbox (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_moderatorinbox_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_moderatorinbox_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_report_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_report_account_comment (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_report_account_comment_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_report_account_comment_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_report_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_report_account_link (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_report_account_link_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_report_account_link_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_report_account_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_report_account_message (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_report_account_message_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_report_account_message_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_report_account_subreddit; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_report_account_subreddit (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_report_account_subreddit_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_report_account_subreddit_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_savehide; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_savehide (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_savehide_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_savehide_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_srmember; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_srmember (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_srmember_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_srmember_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_trophy; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_trophy (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_trophy_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_trophy_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_vote_account_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_vote_account_comment (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_vote_account_comment_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_vote_account_comment_rel_id_seq', 1, false);


--
-- Data for Name: reddit_rel_vote_account_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_rel_vote_account_link (rel_id, thing1_id, thing2_id, name, date) FROM stdin;
\.


--
-- Name: reddit_rel_vote_account_link_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_rel_vote_account_link_rel_id_seq', 1, false);


--
-- Data for Name: reddit_sent_mail; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_sent_mail (msg_hash, account_id, to_addr, fr_addr, reply_to, ip, fullname, date, kind) FROM stdin;
\.


--
-- Data for Name: reddit_thing_account; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_account (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_account_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_account_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_ad; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_ad (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_ad_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_ad_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_award; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_award (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_award_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_award_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_comment; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_comment (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_comment_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_comment_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_link; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_link (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_link_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_link_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_message; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_message (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_message_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_message_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_promocampaign; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_promocampaign (thing_id, ups, downs, deleted, spam, date) FROM stdin;
\.


--
-- Name: reddit_thing_promocampaign_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_promocampaign_thing_id_seq', 1, false);


--
-- Data for Name: reddit_thing_subreddit; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_thing_subreddit (thing_id, ups, downs, deleted, spam, date) FROM stdin;
1	0	0	f	f	2013-07-03 02:29:22.575066+00
\.


--
-- Name: reddit_thing_subreddit_thing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_thing_subreddit_thing_id_seq', 1, true);


--
-- Data for Name: reddit_type; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_type (id, name) FROM stdin;
1	comment
2	account
3	ad
4	award
5	subreddit
6	link
7	message
8	promocampaign
\.


--
-- Name: reddit_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_type_id_seq', 8, true);


--
-- Data for Name: reddit_type_rel; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY reddit_type_rel (id, type1_id, type2_id, name) FROM stdin;
1	2	4	trophy
2	2	1	inbox_account_comment
3	3	5	adsr
4	2	6	jury_account_link
5	5	2	srmember
6	2	5	report_account_subreddit
7	2	7	inbox_account_message
8	2	6	report_account_link
9	5	7	moderatorinbox
10	2	1	vote_account_comment
11	2	2	friend
12	2	6	vote_account_link
13	2	6	savehide
14	2	7	report_account_message
15	2	6	click
16	2	1	report_account_comment
17	5	2	flair
\.


--
-- Name: reddit_type_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddit
--

SELECT pg_catalog.setval('reddit_type_rel_id_seq', 17, true);


--
-- Data for Name: traffic_aggregate; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_aggregate (date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_click; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_click (fullname, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_clicktarget; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_clicktarget (fullname, subreddit, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_lang; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_lang (lang, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_srpaths; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_srpaths (srpath, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_subreddits; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_subreddits (subreddit, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_subscriptions; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_subscriptions (subreddit, date, "unique") FROM stdin;
\.


--
-- Data for Name: traffic_thing; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_thing (fullname, date, "interval", "unique", total) FROM stdin;
\.


--
-- Data for Name: traffic_thingtarget; Type: TABLE DATA; Schema: public; Owner: reddit
--

COPY traffic_thingtarget (fullname, subreddit, date, "interval", "unique", total) FROM stdin;
\.


--
-- Name: authorize_account_id_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY authorize_account_id
    ADD CONSTRAINT authorize_account_id_pkey PRIMARY KEY (account_id);


--
-- Name: authorize_pay_id_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY authorize_pay_id
    ADD CONSTRAINT authorize_pay_id_pkey PRIMARY KEY (account_id, pay_id);


--
-- Name: authorize_ship_id_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY authorize_ship_id
    ADD CONSTRAINT authorize_ship_id_pkey PRIMARY KEY (account_id, ship_id);


--
-- Name: bids_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (transaction, campaign);


--
-- Name: promotion_weight_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY promotion_weight
    ADD CONSTRAINT promotion_weight_pkey PRIMARY KEY (thing_name, promo_idx, sr_name, date);


--
-- Name: reddit_data_account_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_account
    ADD CONSTRAINT reddit_data_account_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_ad_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_ad
    ADD CONSTRAINT reddit_data_ad_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_award_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_award
    ADD CONSTRAINT reddit_data_award_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_comment
    ADD CONSTRAINT reddit_data_comment_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_link
    ADD CONSTRAINT reddit_data_link_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_message
    ADD CONSTRAINT reddit_data_message_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_promocampaign_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_promocampaign
    ADD CONSTRAINT reddit_data_promocampaign_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_adsr_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_adsr
    ADD CONSTRAINT reddit_data_rel_adsr_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_click_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_click
    ADD CONSTRAINT reddit_data_rel_click_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_flair_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_flair
    ADD CONSTRAINT reddit_data_rel_flair_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_friend
    ADD CONSTRAINT reddit_data_rel_friend_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_inbox_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_inbox_account_comment
    ADD CONSTRAINT reddit_data_rel_inbox_account_comment_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_inbox_account_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_inbox_account_message
    ADD CONSTRAINT reddit_data_rel_inbox_account_message_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_jury_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_jury_account_link
    ADD CONSTRAINT reddit_data_rel_jury_account_link_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_moderatorinbox_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_moderatorinbox
    ADD CONSTRAINT reddit_data_rel_moderatorinbox_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_report_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_report_account_comment
    ADD CONSTRAINT reddit_data_rel_report_account_comment_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_report_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_report_account_link
    ADD CONSTRAINT reddit_data_rel_report_account_link_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_report_account_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_report_account_message
    ADD CONSTRAINT reddit_data_rel_report_account_message_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_report_account_subreddit_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_report_account_subreddit
    ADD CONSTRAINT reddit_data_rel_report_account_subreddit_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_savehide_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_savehide
    ADD CONSTRAINT reddit_data_rel_savehide_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_srmember_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_srmember
    ADD CONSTRAINT reddit_data_rel_srmember_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_trophy_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_trophy
    ADD CONSTRAINT reddit_data_rel_trophy_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_vote_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_vote_account_comment
    ADD CONSTRAINT reddit_data_rel_vote_account_comment_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_rel_vote_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_rel_vote_account_link
    ADD CONSTRAINT reddit_data_rel_vote_account_link_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_data_subreddit_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_data_subreddit
    ADD CONSTRAINT reddit_data_subreddit_pkey PRIMARY KEY (thing_id, key);


--
-- Name: reddit_gold_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_gold
    ADD CONSTRAINT reddit_gold_pkey PRIMARY KEY (trans_id);


--
-- Name: reddit_hardcache_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_hardcache
    ADD CONSTRAINT reddit_hardcache_pkey PRIMARY KEY (category, ids);


--
-- Name: reddit_mail_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_mail_queue
    ADD CONSTRAINT reddit_mail_queue_pkey PRIMARY KEY (uid);


--
-- Name: reddit_opt_out_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_opt_out
    ADD CONSTRAINT reddit_opt_out_pkey PRIMARY KEY (email);


--
-- Name: reddit_reject_mail_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_reject_mail
    ADD CONSTRAINT reddit_reject_mail_pkey PRIMARY KEY (msg_hash);


--
-- Name: reddit_rel_adsr_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_adsr
    ADD CONSTRAINT reddit_rel_adsr_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_adsr_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_adsr
    ADD CONSTRAINT reddit_rel_adsr_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_click_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_click
    ADD CONSTRAINT reddit_rel_click_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_click_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_click
    ADD CONSTRAINT reddit_rel_click_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_flair_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_flair
    ADD CONSTRAINT reddit_rel_flair_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_flair_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_flair
    ADD CONSTRAINT reddit_rel_flair_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_friend
    ADD CONSTRAINT reddit_rel_friend_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_friend_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_friend
    ADD CONSTRAINT reddit_rel_friend_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_inbox_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_inbox_account_comment
    ADD CONSTRAINT reddit_rel_inbox_account_comment_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_inbox_account_comment_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_inbox_account_comment
    ADD CONSTRAINT reddit_rel_inbox_account_comment_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_inbox_account_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_inbox_account_message
    ADD CONSTRAINT reddit_rel_inbox_account_message_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_inbox_account_message_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_inbox_account_message
    ADD CONSTRAINT reddit_rel_inbox_account_message_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_jury_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_jury_account_link
    ADD CONSTRAINT reddit_rel_jury_account_link_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_jury_account_link_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_jury_account_link
    ADD CONSTRAINT reddit_rel_jury_account_link_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_moderatorinbox_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_moderatorinbox
    ADD CONSTRAINT reddit_rel_moderatorinbox_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_moderatorinbox_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_moderatorinbox
    ADD CONSTRAINT reddit_rel_moderatorinbox_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_report_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_comment
    ADD CONSTRAINT reddit_rel_report_account_comment_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_report_account_comment_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_comment
    ADD CONSTRAINT reddit_rel_report_account_comment_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_report_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_link
    ADD CONSTRAINT reddit_rel_report_account_link_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_report_account_link_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_link
    ADD CONSTRAINT reddit_rel_report_account_link_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_report_account_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_message
    ADD CONSTRAINT reddit_rel_report_account_message_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_report_account_message_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_message
    ADD CONSTRAINT reddit_rel_report_account_message_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_report_account_subreddi_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_subreddit
    ADD CONSTRAINT reddit_rel_report_account_subreddi_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_report_account_subreddit_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_report_account_subreddit
    ADD CONSTRAINT reddit_rel_report_account_subreddit_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_savehide_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_savehide
    ADD CONSTRAINT reddit_rel_savehide_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_savehide_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_savehide
    ADD CONSTRAINT reddit_rel_savehide_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_srmember_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_srmember
    ADD CONSTRAINT reddit_rel_srmember_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_srmember_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_srmember
    ADD CONSTRAINT reddit_rel_srmember_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_trophy_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_trophy
    ADD CONSTRAINT reddit_rel_trophy_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_trophy_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_trophy
    ADD CONSTRAINT reddit_rel_trophy_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_vote_account_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_vote_account_comment
    ADD CONSTRAINT reddit_rel_vote_account_comment_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_vote_account_comment_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_vote_account_comment
    ADD CONSTRAINT reddit_rel_vote_account_comment_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_rel_vote_account_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_vote_account_link
    ADD CONSTRAINT reddit_rel_vote_account_link_pkey PRIMARY KEY (rel_id);


--
-- Name: reddit_rel_vote_account_link_thing1_id_thing2_id_name_key; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_rel_vote_account_link
    ADD CONSTRAINT reddit_rel_vote_account_link_thing1_id_thing2_id_name_key UNIQUE (thing1_id, thing2_id, name);


--
-- Name: reddit_sent_mail_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_sent_mail
    ADD CONSTRAINT reddit_sent_mail_pkey PRIMARY KEY (msg_hash);


--
-- Name: reddit_thing_account_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_account
    ADD CONSTRAINT reddit_thing_account_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_ad_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_ad
    ADD CONSTRAINT reddit_thing_ad_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_award_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_award
    ADD CONSTRAINT reddit_thing_award_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_comment
    ADD CONSTRAINT reddit_thing_comment_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_link_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_link
    ADD CONSTRAINT reddit_thing_link_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_message_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_message
    ADD CONSTRAINT reddit_thing_message_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_promocampaign_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_promocampaign
    ADD CONSTRAINT reddit_thing_promocampaign_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_thing_subreddit_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_thing_subreddit
    ADD CONSTRAINT reddit_thing_subreddit_pkey PRIMARY KEY (thing_id);


--
-- Name: reddit_type_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_type
    ADD CONSTRAINT reddit_type_pkey PRIMARY KEY (id);


--
-- Name: reddit_type_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY reddit_type_rel
    ADD CONSTRAINT reddit_type_rel_pkey PRIMARY KEY (id);


--
-- Name: traffic_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_aggregate
    ADD CONSTRAINT traffic_aggregate_pkey PRIMARY KEY (date, "interval");


--
-- Name: traffic_click_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_click
    ADD CONSTRAINT traffic_click_pkey PRIMARY KEY (fullname, date, "interval");


--
-- Name: traffic_clicktarget_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_clicktarget
    ADD CONSTRAINT traffic_clicktarget_pkey PRIMARY KEY (fullname, subreddit, date, "interval");


--
-- Name: traffic_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_lang
    ADD CONSTRAINT traffic_lang_pkey PRIMARY KEY (lang, date, "interval");


--
-- Name: traffic_srpaths_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_srpaths
    ADD CONSTRAINT traffic_srpaths_pkey PRIMARY KEY (srpath, date, "interval");


--
-- Name: traffic_subreddits_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_subreddits
    ADD CONSTRAINT traffic_subreddits_pkey PRIMARY KEY (subreddit, date, "interval");


--
-- Name: traffic_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_subscriptions
    ADD CONSTRAINT traffic_subscriptions_pkey PRIMARY KEY (subreddit, date);


--
-- Name: traffic_thing_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_thing
    ADD CONSTRAINT traffic_thing_pkey PRIMARY KEY (fullname, date, "interval");


--
-- Name: traffic_thingtarget_pkey; Type: CONSTRAINT; Schema: public; Owner: reddit; Tablespace: 
--

ALTER TABLE ONLY traffic_thingtarget
    ADD CONSTRAINT traffic_thingtarget_pkey PRIMARY KEY (fullname, subreddit, date, "interval");


--
-- Name: idx_account_id_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_account_id_reddit_gold ON reddit_gold USING btree (account_id);


--
-- Name: idx_base_url_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_account ON reddit_data_account USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_ad ON reddit_data_ad USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_award ON reddit_data_award USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_comment ON reddit_data_comment USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_link ON reddit_data_link USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_message ON reddit_data_message USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_click ON reddit_data_rel_click USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_base_url_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_base_url_reddit_data_subreddit ON reddit_data_subreddit USING btree (base_url(lower((value)::text))) WHERE ((key)::text = 'url'::text);


--
-- Name: idx_controversy_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_account ON reddit_thing_account USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_ad ON reddit_thing_ad USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_award ON reddit_thing_award USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_comment ON reddit_thing_comment USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_link ON reddit_thing_link USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_message ON reddit_thing_message USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (controversy(ups, downs), date);


--
-- Name: idx_controversy_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_controversy_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (controversy(ups, downs), date);


--
-- Name: idx_date_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_gold ON reddit_gold USING btree (date);


--
-- Name: idx_date_reddit_mail_queue; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_mail_queue ON reddit_mail_queue USING btree (date);


--
-- Name: idx_date_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_adsr ON reddit_rel_adsr USING btree (date);


--
-- Name: idx_date_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_click ON reddit_rel_click USING btree (date);


--
-- Name: idx_date_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_flair ON reddit_rel_flair USING btree (date);


--
-- Name: idx_date_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_friend ON reddit_rel_friend USING btree (date);


--
-- Name: idx_date_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (date);


--
-- Name: idx_date_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (date);


--
-- Name: idx_date_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (date);


--
-- Name: idx_date_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (date);


--
-- Name: idx_date_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (date);


--
-- Name: idx_date_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (date);


--
-- Name: idx_date_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (date);


--
-- Name: idx_date_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (date);


--
-- Name: idx_date_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_savehide ON reddit_rel_savehide USING btree (date);


--
-- Name: idx_date_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_srmember ON reddit_rel_srmember USING btree (date);


--
-- Name: idx_date_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_trophy ON reddit_rel_trophy USING btree (date);


--
-- Name: idx_date_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (date);


--
-- Name: idx_date_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (date);


--
-- Name: idx_date_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_account ON reddit_thing_account USING btree (date);


--
-- Name: idx_date_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_ad ON reddit_thing_ad USING btree (date);


--
-- Name: idx_date_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_award ON reddit_thing_award USING btree (date);


--
-- Name: idx_date_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_comment ON reddit_thing_comment USING btree (date);


--
-- Name: idx_date_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_link ON reddit_thing_link USING btree (date);


--
-- Name: idx_date_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_message ON reddit_thing_message USING btree (date);


--
-- Name: idx_date_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (date);


--
-- Name: idx_date_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_date_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (date);


--
-- Name: idx_deleted_spam_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_account ON reddit_thing_account USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_ad ON reddit_thing_ad USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_award ON reddit_thing_award USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_comment ON reddit_thing_comment USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_link ON reddit_thing_link USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_message ON reddit_thing_message USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (deleted, spam);


--
-- Name: idx_deleted_spam_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_deleted_spam_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (deleted, spam);


--
-- Name: idx_email_reddit_opt_out; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_email_reddit_opt_out ON reddit_opt_out USING btree (email);


--
-- Name: idx_expiration_reddit_hardcache; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_expiration_reddit_hardcache ON reddit_hardcache USING btree (expiration);


--
-- Name: idx_hot_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_account ON reddit_thing_account USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_ad ON reddit_thing_ad USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_award ON reddit_thing_award USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_comment ON reddit_thing_comment USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_link ON reddit_thing_link USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_message ON reddit_thing_message USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (hot(ups, downs, date), date);


--
-- Name: idx_hot_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_hot_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (hot(ups, downs, date), date);


--
-- Name: idx_id_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_account ON reddit_data_account USING btree (thing_id);


--
-- Name: idx_id_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_ad ON reddit_data_ad USING btree (thing_id);


--
-- Name: idx_id_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_award ON reddit_data_award USING btree (thing_id);


--
-- Name: idx_id_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_comment ON reddit_data_comment USING btree (thing_id);


--
-- Name: idx_id_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_link ON reddit_data_link USING btree (thing_id);


--
-- Name: idx_id_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_message ON reddit_data_message USING btree (thing_id);


--
-- Name: idx_id_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_click ON reddit_data_rel_click USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (thing_id);


--
-- Name: idx_id_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (thing_id);


--
-- Name: idx_id_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_data_subreddit ON reddit_data_subreddit USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_account ON reddit_thing_account USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_ad ON reddit_thing_ad USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_award ON reddit_thing_award USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_comment ON reddit_thing_comment USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_link ON reddit_thing_link USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_message ON reddit_thing_message USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (thing_id);


--
-- Name: idx_id_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_id_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (thing_id);


--
-- Name: idx_ip_network_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_account ON reddit_data_account USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_ad ON reddit_data_ad USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_award ON reddit_data_award USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_comment ON reddit_data_comment USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_link ON reddit_data_link USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_message ON reddit_data_message USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_click ON reddit_data_rel_click USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_ip_network_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_ip_network_reddit_data_subreddit ON reddit_data_subreddit USING btree (ip_network((value)::text)) WHERE ((key)::text = 'ip'::text);


--
-- Name: idx_key_value_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_account ON reddit_data_account USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_ad ON reddit_data_ad USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_award ON reddit_data_award USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_comment ON reddit_data_comment USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_link ON reddit_data_link USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_message ON reddit_data_message USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_click ON reddit_data_rel_click USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_key_value_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_key_value_reddit_data_subreddit ON reddit_data_subreddit USING btree (key, "substring"((value)::text, 1, 1000));


--
-- Name: idx_kind_reddit_mail_queue; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_kind_reddit_mail_queue ON reddit_mail_queue USING btree (kind);


--
-- Name: idx_lower_key_value_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_account ON reddit_data_account USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_ad ON reddit_data_ad USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_award ON reddit_data_award USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_comment ON reddit_data_comment USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_link ON reddit_data_link USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_message ON reddit_data_message USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_click ON reddit_data_rel_click USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_lower_key_value_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_lower_key_value_reddit_data_subreddit ON reddit_data_subreddit USING btree (key, lower((value)::text)) WHERE ((key)::text = 'name'::text);


--
-- Name: idx_name_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_adsr ON reddit_rel_adsr USING btree (name);


--
-- Name: idx_name_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_click ON reddit_rel_click USING btree (name);


--
-- Name: idx_name_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_flair ON reddit_rel_flair USING btree (name);


--
-- Name: idx_name_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_friend ON reddit_rel_friend USING btree (name);


--
-- Name: idx_name_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (name);


--
-- Name: idx_name_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (name);


--
-- Name: idx_name_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (name);


--
-- Name: idx_name_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (name);


--
-- Name: idx_name_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (name);


--
-- Name: idx_name_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (name);


--
-- Name: idx_name_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (name);


--
-- Name: idx_name_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (name);


--
-- Name: idx_name_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_savehide ON reddit_rel_savehide USING btree (name);


--
-- Name: idx_name_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_srmember ON reddit_rel_srmember USING btree (name);


--
-- Name: idx_name_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_trophy ON reddit_rel_trophy USING btree (name);


--
-- Name: idx_name_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (name);


--
-- Name: idx_name_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_name_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (name);


--
-- Name: idx_payer_email_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_payer_email_reddit_gold ON reddit_gold USING btree (payer_email);


--
-- Name: idx_score_reddit_thing_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_account ON reddit_thing_account USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_ad ON reddit_thing_ad USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_award ON reddit_thing_award USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_comment ON reddit_thing_comment USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_link ON reddit_thing_link USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_message ON reddit_thing_message USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_promocampaign ON reddit_thing_promocampaign USING btree (score(ups, downs), date);


--
-- Name: idx_score_reddit_thing_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_score_reddit_thing_subreddit ON reddit_thing_subreddit USING btree (score(ups, downs), date);


--
-- Name: idx_secret_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE UNIQUE INDEX idx_secret_reddit_gold ON reddit_gold USING btree (secret);


--
-- Name: idx_status_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_status_reddit_gold ON reddit_gold USING btree (status);


--
-- Name: idx_subscr_id_reddit_gold; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_subscr_id_reddit_gold ON reddit_gold USING btree (subscr_id);


--
-- Name: idx_thing1_id_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_adsr ON reddit_rel_adsr USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_click ON reddit_rel_click USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_flair ON reddit_rel_flair USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_friend ON reddit_rel_friend USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_savehide ON reddit_rel_savehide USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_srmember ON reddit_rel_srmember USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_trophy ON reddit_rel_trophy USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (thing1_id);


--
-- Name: idx_thing1_id_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_id_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (thing1_id);


--
-- Name: idx_thing1_name_date_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_adsr ON reddit_rel_adsr USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_click ON reddit_rel_click USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_flair ON reddit_rel_flair USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_friend ON reddit_rel_friend USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_savehide ON reddit_rel_savehide USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_srmember ON reddit_rel_srmember USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_trophy ON reddit_rel_trophy USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (thing1_id, name, date);


--
-- Name: idx_thing1_name_date_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing1_name_date_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (thing1_id, name, date);


--
-- Name: idx_thing2_id_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_adsr ON reddit_rel_adsr USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_click ON reddit_rel_click USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_flair ON reddit_rel_flair USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_friend ON reddit_rel_friend USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_savehide ON reddit_rel_savehide USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_srmember ON reddit_rel_srmember USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_trophy ON reddit_rel_trophy USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (thing2_id);


--
-- Name: idx_thing2_id_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_id_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (thing2_id);


--
-- Name: idx_thing2_name_date_reddit_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_adsr ON reddit_rel_adsr USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_click ON reddit_rel_click USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_flair ON reddit_rel_flair USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_friend ON reddit_rel_friend USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_inbox_account_comment ON reddit_rel_inbox_account_comment USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_inbox_account_message ON reddit_rel_inbox_account_message USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_jury_account_link ON reddit_rel_jury_account_link USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_moderatorinbox ON reddit_rel_moderatorinbox USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_report_account_comment ON reddit_rel_report_account_comment USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_report_account_link ON reddit_rel_report_account_link USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_report_account_message ON reddit_rel_report_account_message USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_report_account_subreddit ON reddit_rel_report_account_subreddit USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_savehide ON reddit_rel_savehide USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_srmember ON reddit_rel_srmember USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_trophy ON reddit_rel_trophy USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_vote_account_comment ON reddit_rel_vote_account_comment USING btree (thing2_id, name, date);


--
-- Name: idx_thing2_name_date_reddit_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing2_name_date_reddit_rel_vote_account_link ON reddit_rel_vote_account_link USING btree (thing2_id, name, date);


--
-- Name: idx_thing_id_reddit_data_account; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_account ON reddit_data_account USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_ad; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_ad ON reddit_data_ad USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_award; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_award ON reddit_data_award USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_comment ON reddit_data_comment USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_link ON reddit_data_link USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_message ON reddit_data_message USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_promocampaign; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_promocampaign ON reddit_data_promocampaign USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_adsr; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_adsr ON reddit_data_rel_adsr USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_click; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_click ON reddit_data_rel_click USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_flair; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_flair ON reddit_data_rel_flair USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_friend; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_friend ON reddit_data_rel_friend USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_inbox_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_inbox_account_comment ON reddit_data_rel_inbox_account_comment USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_inbox_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_inbox_account_message ON reddit_data_rel_inbox_account_message USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_jury_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_jury_account_link ON reddit_data_rel_jury_account_link USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_moderatorinbox; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_moderatorinbox ON reddit_data_rel_moderatorinbox USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_report_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_report_account_comment ON reddit_data_rel_report_account_comment USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_report_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_report_account_link ON reddit_data_rel_report_account_link USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_report_account_message; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_report_account_message ON reddit_data_rel_report_account_message USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_report_account_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_report_account_subreddit ON reddit_data_rel_report_account_subreddit USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_savehide; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_savehide ON reddit_data_rel_savehide USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_srmember; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_srmember ON reddit_data_rel_srmember USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_trophy; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_trophy ON reddit_data_rel_trophy USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_vote_account_comment; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_vote_account_comment ON reddit_data_rel_vote_account_comment USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_rel_vote_account_link; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_rel_vote_account_link ON reddit_data_rel_vote_account_link USING btree (thing_id);


--
-- Name: idx_thing_id_reddit_data_subreddit; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX idx_thing_id_reddit_data_subreddit ON reddit_data_subreddit USING btree (thing_id);


--
-- Name: ix_bids_account_id; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_bids_account_id ON bids USING btree (account_id);


--
-- Name: ix_bids_pay_id; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_bids_pay_id ON bids USING btree (pay_id);


--
-- Name: ix_bids_thing_id; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_bids_thing_id ON bids USING btree (thing_id);


--
-- Name: ix_promotion_weight_account_id; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_promotion_weight_account_id ON promotion_weight USING btree (account_id);


--
-- Name: ix_promotion_weight_date; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_promotion_weight_date ON promotion_weight USING btree (date);


--
-- Name: ix_promotion_weight_promo_idx; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_promotion_weight_promo_idx ON promotion_weight USING btree (promo_idx);


--
-- Name: ix_promotion_weight_sr_name; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_promotion_weight_sr_name ON promotion_weight USING btree (sr_name);


--
-- Name: ix_promotion_weight_thing_name; Type: INDEX; Schema: public; Owner: reddit; Tablespace: 
--

CREATE INDEX ix_promotion_weight_thing_name ON promotion_weight USING btree (thing_name);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

