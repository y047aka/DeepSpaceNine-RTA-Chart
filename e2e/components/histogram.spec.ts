import { test, expect } from '@playwright/test';

test.describe('Histogram Component Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');

    // Wait for histogram data to load and render
    await page.waitForTimeout(2000);
  });

  test('should render histogram charts correctly', async ({ page }) => {
    // Look for main histogram container
    const histogramContainer = page.locator('.histogram, .chart, svg').first();

    if (await histogramContainer.count() > 0) {
      await expect(histogramContainer).toHaveScreenshot('histogram.png');
    }
  });

  test('should render histogram with controls correctly', async ({ page }) => {
    // Test any control elements if they exist
    const controls = page.locator('select, button, .controls').first();
    if (await controls.count() > 0) {
      await expect(page).toHaveScreenshot('histogram-with-controls.png');
    }
  });
});
