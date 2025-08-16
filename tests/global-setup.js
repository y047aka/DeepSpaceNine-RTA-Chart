/**
 * Global setup for Playwright tests
 * This runs once before all tests
 */
async function globalSetup(config) {
  console.log('🔧 Starting global setup for VRT tests...');
  
  // Any global setup logic can be added here
  // For example: database seeding, cache warming, etc.
  
  console.log('✅ Global setup completed');
}

module.exports = globalSetup;