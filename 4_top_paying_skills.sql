-- question : what are the top skills based on salary?

-- look at the average salary assoiciated with each skill for data analyst

-- focuses on roles with specified salaries regardless of the location

select
    skills,
    round(avg(salary_year_avg), 0) as avg_salary

    from job_postings_fact

    join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

    where job_title like '%data analyst%' and salary_year_avg is not null
    
group by skills
order by avg_salary desc
limit 25

