select  * from constituencywise_details
select  top 10 * from constituencywise_results
select  top 10 * from partywise_results
select  top 10 * from states
select   top 10 * from statewise_results

-- total seat 
select count(distinct(Constituency_ID)) from constituencywise_details

--What is the total number of seats available for elections in each state


select  s.state, count(distinct(cd.Constituency_ID)) as totalseat_perstates from constituencywise_details as cd
inner join constituencywise_results as cr
on cd.Constituency_ID=cr.Constituency_ID
inner join statewise_results sr on
sr.Parliament_Constituency=cr.Parliament_Constituency
inner join states s on
s.State_ID=sr.State_ID
group by s.State
order by totalseat_perstates desc;


--Total Seats Won by NDA Allianz

select * from partywise_results


with cte as(
SELECT *,
    CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            )  THEN Won
            ELSE 0 
            end as yiuu
       
FROM 
    partywise_results
)
select sum(yiuu) as totlaNDAwinning from cte





    select *,
    case
    when party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM') 
                )  THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won

                from  partywise_results



---Seats Won by NDA Allianz Parties


select party as party_name, won as seat_won from partywise_results

where party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM') 
order by seat_won desc;


--Total Seats Won by I.N.D.I.A. Allianz

select * from partywise_results

select 
     sum( case
          when party in(
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            else 0
            end) as jio
            from partywise_results


--Seats Won by I.N.D.I.A. Allianz Parties


with cte as(
select party, won 
from partywise_results
where party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
              )  
select sum(won) as dkffj from cte


--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

select * from partywise_results

alter table partywise_results
add party_alliance varchar(100)

update partywise_results
set party_alliance = 'NDA'
where party in('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')


                select * from partywise_results

                select party_alliance , sum(won) from partywise_results
                group by party_alliance


                update partywise_results
                set party_alliance='other'
                where party_alliance is null

                select  distinct(party_alliance) from party_results

                select distinct(party_alliance) from partywise_results

---Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

select  pr.party_alliance,s.State, sum(distinct(pr.won)) as totalsr

from partywise_results as pr inner join constituencywise_results as cr
on pr.Party_ID=cr.Party_ID  inner join statewise_results as sr
on cr.Parliament_Constituency=sr.Parliament_Constituency inner join states as s
on sr.State_ID=s.State_ID
group by pr.party_alliance,s.State
order by  count(distinct(pr.won)) desc

SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;

    select party_alliance, sum(won) from partywise_results
    group by party_alliance

--Winning candidate's name, their party name, total votes, and the margin of 
--victory for a specific state and constituency?


select  Winning_Candidate,party,party_alliance,Total_Votes,cr.Margin , cr.Constituency_Name, s.State

from partywise_results as pr inner join constituencywise_results as cr
on pr.Party_ID=cr.Party_ID  inner join statewise_results as sr
on cr.Parliament_Constituency=sr.Parliament_Constituency inner join states as s
on sr.State_ID=s.State_ID

where s.state='utter pradesh'  
and cr.Constituency_Name='meerut'


SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'AMETHI';







































