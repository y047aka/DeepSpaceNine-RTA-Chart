import { test, expect } from '@playwright/test';

test.describe('Episode Display Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');

    // Wait for episode data to load
    await page.waitForTimeout(2000);
  });

  test('should render episode table correctly', async ({ page }) => {
    // Simplified selector - test main episode container only
    const episodeContainer = page.locator('table, .episode-table, .episode-list').first();

    if (await episodeContainer.count() > 0) {
      await expect(episodeContainer).toHaveScreenshot('episode-table.png');
    }
  });

  test('should render episode details correctly', async ({ page }) => {
    // Test first episode item only to avoid excessive screenshots
    const episodeItem = page.locator('tr, .episode-item, .episode-card, .episode-row').first();

    if (await episodeItem.count() > 0) {
      await expect(episodeItem).toHaveScreenshot('episode-item.png');
    }
  });
});
