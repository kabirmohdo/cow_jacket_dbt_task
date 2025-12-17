# CowJacket dbt Cloud Implementation

CowJacket wants to adopt dbt as their transformation tool in order to standardize transformations, simplify testing, improve lineage visibility, and make it easier to manage transformation workflows. You have been asked to set up the dbt Cloud environment and use the [SQL module data](https://github.com/dataengineering-community/launchpad/tree/main/04-SQL) as source.

We are to:

- Set up a dbt Cloud account and create three environments: dev, staging, and production.
- The staging environment is where the dbt Cloud CI job will run.

## Follow the three-layer modeling approach:
- staging/
- intermediate/
- marts/

The project should follow a direct promotion strategy, where a dbt Cloud CI job is triggered automatically for every pull request. Once approved, models can be promoted directly to production.

The project should also include:
- seeds/
- sources/
- models/
- exposures/

At least one model should materialize to a different dataset than the default one for the environment. if the production schema is analytics, ensure a particular job writes to analytics_marts.

Guardrail should be put in place so that this model does not materialize in production when running from the dev environment.

We are also expected to:

- Set up unit tests and data tests, including generic and custom tests.
- Put in measures to optimize test performance, especially for large datasets.
- Ensure that every model and column is properly documented.
- For observability, make sure that every dbt run/build logs useful metadata into a warehouse table.
- This should include:

  - model name
  - environment
  - duration
  - status
  - row counT
  - and any other relevant metadata
    
This will help the team monitor performance, debug issues, and track changes over time.

### dbt 

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/4bfa9a0d-5be7-4ce9-8814-b895bdcceaab" />


### Snowflakes WareHouse

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/dde3823f-ce4e-42f8-9482-3ae4220922b5" />

