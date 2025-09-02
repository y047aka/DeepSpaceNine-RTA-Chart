const fs = require('fs');
const path = require('path');
const { Client } = require('pg');

// PostgreSQL connection configuration
const dbConfig = {
    host: 'postgres',
    port: 5432,
    database: 'app_db',
    user: 'user',
    password: 'passw0rd',
};

async function migrateEpisodes() {
    console.log('Starting episode migration...');

    // Read JSON file
    const jsonFilePath = path.join(__dirname, '..', 'app', 'priv', 'static', 'episodes.json');
    let episodesData;

    try {
        const jsonContent = fs.readFileSync(jsonFilePath, 'utf8');
        episodesData = JSON.parse(jsonContent);
        console.log(`Found ${episodesData.length} episodes in JSON file`);
    } catch (error) {
        console.error('Failed to read or parse episodes.json:', error.message);
        process.exit(1);
    }

    // Connect to PostgreSQL
    const client = new Client(dbConfig);

    try {
        await client.connect();
        console.log('Connected to PostgreSQL database');

        let successCount = 0;
        let errorCount = 0;

        // Insert each episode
        for (const episode of episodesData) {
            try {
                await insertEpisode(client, episode);
                successCount++;
                if (successCount % 25 === 0) {
                    console.log(`Processed ${successCount}/${episodesData.length} episodes...`);
                }
            } catch (error) {
                console.error(`Failed to insert episode S${episode.season}E${episode.episode}:`, error.message);
                errorCount++;
            }
        }

        console.log(`Migration completed!`);
        console.log(`Successfully migrated: ${successCount} episodes`);
        if (errorCount > 0) {
            console.log(`Errors: ${errorCount} episodes`);
        }

    } catch (error) {
        console.error('Database connection or migration failed:', error.message);
        process.exit(1);
    } finally {
        await client.end();
        console.log('Database connection closed');
    }
}

async function insertEpisode(client, episode) {
    const sql = `
    INSERT INTO episodes (
      season, episode, title, title_ja, importance,
      netflix_id, netflix_synopsis, url_imdb,
      characters, organizations
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
    )
    ON CONFLICT (season, episode) DO NOTHING
  `;

    // Convert characters array to JSON string
    const charactersJson = JSON.stringify({
        characters: episode.characters || []
    });

    // Convert organizations array to JSON string
    const organizationsJson = JSON.stringify({
        organizations: episode.organizations || []
    });

    const values = [
        episode.season,
        episode.episode,
        episode.title,
        episode.title_ja || null,
        episode.importance,
        episode.netflix_id || null,
        episode.netflix_synopsis || null,
        episode.url_imdb || null,
        charactersJson,
        organizationsJson
    ];

    await client.query(sql, values);
}

// Run migration
migrateEpisodes().catch(error => {
    console.error('Migration script failed:', error.message);
    process.exit(1);
});
