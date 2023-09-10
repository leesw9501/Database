import mysql from 'mysql2';

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1324qaws',
    database: 'week3_company',
})

const promisePool = pool.promise();

const sql = {
    getEmployee: async()=>{
        const results = await promisePool.query(`
        select * from employee
        `)

        return results;
    },
};

export default sql;