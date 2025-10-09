#!/usr/bin/env python3
import os
import sys
import sqlite3
import bcrypt

DB_PATH = "/etc/x-ui/x-ui.db"

def main():
    if not os.path.exists(DB_PATH):
        print(f"❌ Ошибка: база данных не найдена: {DB_PATH}")
        sys.exit(1)

    web_port = os.getenv("WEB_PORT")
    web_path = os.getenv("WEB_PATH")
    username = os.getenv("X_UI_USERNAME")
    password = os.getenv("X_UI_PASSWORD")

    if not all([web_port, web_path, username, password]):
        print("❌ Ошибка: не заданы все необходимые переменные окружения:")
        print("  WEB_PORT, WEB_PATH, X_UI_USERNAME, X_UI_PASSWORD")
        sys.exit(1)

    hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt(rounds=10)).decode("utf-8")

    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    try:
        cur.execute('UPDATE settings SET value = ? WHERE key = "webPort";', (web_port,))
        cur.execute('UPDATE settings SET value = ? WHERE key = "webBasePath";', (web_path,))

        cur.execute('DELETE FROM users;')

        cur.execute(
            'INSERT INTO users (username, password) VALUES (?, ?);',
            (username, hashed_password)
        )

        conn.commit()
        print("✅ Изменения успешно применены и пароль захэширован с bcrypt.")

    except Exception as e:
        conn.rollback()
        print(f"❌ Ошибка при обновлении БД: {e}")

    finally:
        conn.close()

if __name__ == "__main__":
    main()
