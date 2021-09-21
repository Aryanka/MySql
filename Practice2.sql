select count(venue_name) from soccer_venue;
select count(distinct team_id) from player_mast;	
select match_no, play_date, goal_score from match_mast where stop1_sec =0;
select count(distinct (match_no)) from match_details where goal_score =0 and win_lose ='d' and play_stage ='g';
select count(distinct (match_no)) from match_details where goal_score =1 and decided_by ='p';


SELECT 
    venue_name, city
FROM
    soccer_venue AS sv
        INNER JOIN
    soccer_city AS sc ON sv.city_id = sc.city_id
        INNER JOIN
    match_mast AS m ON sv.venue_id = m.venue_id
WHERE
    m.play_stage = 'f';
    


select m.goal_score,match_no,country_name from match_details as m inner join soccer_country as s on m.team_id=s.country_id where m.decided_by ='n';

select player_id, s.player_name from goal_details as g inner join player_mast as p on g.team_id =p.team_id inner join soccer_country as s on s.country_id =p.tram_id where play_stage ='f';

select country_name, country_id, city, city_id from soccer_country as s inner join soccer_city as sc on sc.country_id=s.country_id inner join soccer_venue as sv on sc.city_id=sv.city_id GROUP BY country_name;

select referee_name, referee_id, country_id, country_name from soccer_country as s inner  join referee_mast as r on r.country_id=s.country_id inner join match_mast as m on m.refree_id=r.refree_id where match_no=1 ;

select venue_id,  country_id ,country_name from goal_details as g inner join soccer_country as s on g.team_id =s.country_id inner join match_mast as m on m.match_no=g.match_no where g.goal_score;
