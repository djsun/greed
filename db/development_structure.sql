CREATE TABLE "faces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" integer, "roll_id" integer, "position" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "games" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "players" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "name" varchar(255), "game_id" integer, "score" integer DEFAULT 0, "strategy" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "rolls" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "score" integer DEFAULT 0 NOT NULL, "accumulated_score" integer DEFAULT 0 NOT NULL, "unused" integer DEFAULT 0 NOT NULL, "action_name" varchar(255), "turn_id" integer, "position" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "turns" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "player_id" integer, "position" integer, "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090417195107');

INSERT INTO schema_migrations (version) VALUES ('20090417195145');

INSERT INTO schema_migrations (version) VALUES ('20090428151959');

INSERT INTO schema_migrations (version) VALUES ('20090501194826');

INSERT INTO schema_migrations (version) VALUES ('20090501194952');