-- question: what are the most optimal skills to learn

-- identify skills which are high in demand and associated with high average salries in data analyst roles

-- concentrate on remote positions with specified salaries

select
    skills,
    count(*) as demand_count,
    round(avg(salary_year_avg), 0) as avg_salary

    from job_postings_fact

    join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

    where job_title_short ='Data Analyst' and salary_year_avg is not null 
    group by skills
    order by avg_salary desc, demand_count desc