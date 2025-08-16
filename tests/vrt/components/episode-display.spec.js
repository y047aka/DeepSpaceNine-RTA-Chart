import { test, expect } from '@playwright/test';

test.describe('Episode Display Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');
    
    // Wait for episode data to load
    await page.waitForTimeout(2000);
  });

  test('should render episode table correctly', async ({ page }) => {
    // Look for episode table or list elements
    const episodeSelectors = [
      'table',
      '.episode-table',
      '.episode-list',
      '.episodes',
      '[data-testid*="episode"]',
      '[class*="episode"]'
    ];

    for (const selector of episodeSelectors) {
      const elements = page.locator(selector);
      const count = await elements.count();
      
      if (count > 0) {
        for (let i = 0; i < count; i++) {
          const element = elements.nth(i);
          await expect(element).toHaveScreenshot(`episode-display-${selector.replace(/[^a-zA-Z0-9]/g, '')}-${i}.png`);
        }
      }
    }
  });

  test('should render episode details correctly', async ({ page }) => {
    // Look for individual episode entries
    const episodeItems = page.locator('tr, .episode-item, .episode-card, .episode-row');
    const count = await episodeItems.count();
    
    if (count > 0) {
      // Test first few episode items (limit to avoid too many screenshots)
      const itemsToTest = Math.min(count, 3);
      for (let i = 0; i < itemsToTest; i++) {
        const item = episodeItems.nth(i);
        await expect(item).toHaveScreenshot(`episode-item-${i}.png`);
      }
    }
  });

  test('should render episode metadata correctly', async ({ page }) => {
    // Test episode-specific information display
    const metadataSelectors = [
      '.season',
      '.episode-number',
      '.title',
      '.importance',
      '.netflix-id',
      '[class*="season"]',
      '[class*="title"]',
      '[class*="importance"]'
    ];

    for (const selector of metadataSelectors) {
      const elements = page.locator(selector);
      const count = await elements.count();
      
      if (count > 0) {
        // Take screenshot of container with this metadata
        const container = elements.first().locator('..').first();
        await expect(container).toHaveScreenshot(`episode-metadata-${selector.replace(/[^a-zA-Z0-9]/g, '')}.png`);
      }
    }
  });

  test('should render character and organization associations correctly', async ({ page }) => {
    // Test character/organization display within episodes
    const associationSelectors = [
      '.characters',
      '.organizations',
      '.character-list',
      '.organization-list',
      '[data-characters]',
      '[data-organizations]'
    ];

    for (const selector of associationSelectors) {
      const elements = page.locator(selector);
      const count = await elements.count();
      
      if (count > 0) {
        const element = elements.first();
        await expect(element).toHaveScreenshot(`episode-associations-${selector.replace(/[^a-zA-Z0-9]/g, '')}.png`);
      }
    }
  });
});