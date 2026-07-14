-- question: what are the top paying skills for  data analyst jobs?
-- identify the top 10 highest paying data analyst roles 
-- add specific skills required for these roles
-- why? it provides a detailed outlook at which high paying jobs demand certain skills, helping job seekers to understand which skills to develop to allign for top salaries 
select job_title,
    job_location,
    job_posted_date,
    salary_year_avg,
    skills
from job_postings_fact -- join company_dim  on job_postings_fact.company_id = company_dim.company_id
    join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title like '%Data Analyst%'
    and skills in (
        'sql',
        'python',
        'r',
        'Excel',
        'pandas',
        'numpy',
        'sqlite',
        'sqlserver',
        'mysql'
    )
    and salary_year_avg is not null
    and job_location = 'Anywhere'
order by salary_year_avg desc
limit 10;
