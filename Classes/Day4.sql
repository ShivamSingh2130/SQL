-- 5. UPDATE Query

-- Disable Safe Update Mode Temporarily
SET SQL_SAFE_UPDATES =0;
SET SQL_SAFE_UPDATE =1;  -- RE-enable safe update

select* from companies;

-- 1.updatea specific Record
UPDATE Companies
SET revenue = 2200000000000.00,employee_count=520000
WHERE company-name ='TATA consultency Services';


-- 2. Update Multiple Records
UPDATE Companies
SET industry = 'telecom'
WHERE Company_name IN('Bharat Airtel','Relience Industry limited');

-- 3. Update Revenue for All Companies in a specific Industry
UPDATE Companies
SET revenue = revenue *1.10
WHERE industry = 'Banking';

-- 4. Update Employee count for a specific company
UPDATE Companies
SET employee_count=210000
WHERE company_name ='Wipro';


-- 5. Update Headquareters Location
UPDATE Companies
SET headquareteres_location= 'Gurugram,Harayana'
WHERE company_name ='HDFC Bank';

-- 6. Udate Established Date
UPDATE  Companies
SET established_date='1994-01-01'
WHERE company_name='ICIC Banl';

-- 7. Update Web site URL
UPDATE  Companies
SET website='http//www.infosys.co.in'
WHERE company-name='INfosys';

-- 8. Update Revenue for ZComponies with Low Employee Count
UPDATE Companies
SET revenue =0
WHERE employee_count <50000;

-- 9. Update industry for specific Company
UPDATE Companies
SET industry ='Consumer Product'
WHERE company_name='Hindustan unilever limited';

-- 10. Update multiple fields for a specific company
UPDATE Companies
SET revenue = 160000000000.00, industry='Construction & Engineering'
WHERE company_name = 'Larsen & Turbo';
