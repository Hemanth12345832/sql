-- question: what are the most in demanded skills for data analysts

-- join job postings to inner join table similar to query 2

-- identify top 5 in demand skills for data analysts

-- focus on all job postings 

-- why? retreive the the top 5 skills in the job market which has high demand, providing insights into most valuable skills in for the job seekers 

select
    skills,
    count(*) as demand_count

    from job_postings_fact

    join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

    where job_title like '%data analyst%'
    
group by skills
order by demand_count desc
limit 5
