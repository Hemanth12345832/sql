-- question: what are the top paying data analyst jobs?

-- identify the top 10 highest paying data analyst roles that are available remotely

-- focuses on job postings with specified salaries (remove nulls)

-- why? highlight the top paying oppurtuninties for data analysts, offering insights into employment oppurtunites  

select 
    job_id,
    job_title,
    job_location,
    job_posted_date,
    salary_year_avg,
    name as company_name

    from job_postings_fact
    join company_dim  on job_postings_fact.company_id = company_dim.company_id

where 
    job_title like '%Data Analyst%'
    and salary_year_avg is not null
    and job_location = 'Anywhere'
order by salary_year_avg desc
limit 10;