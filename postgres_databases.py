import psycopg2


if __name__ == "__main__":
    try:
        url = "host='{0}' dbname='{1}' user='{2}' password='{3}'".format('localhost', 'postgres', 'postgres', 'admin123')


        conn = psycopg2.connect(url)


        cursor = conn.cursor()

        sql = """SELECT datname FROM pg_database"""

        cursor.execute(sql)

        for row in cursor:
            print(row[0])


        cursor.close()
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)
