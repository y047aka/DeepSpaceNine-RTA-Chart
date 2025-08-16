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
      await expect(histogramContainer).toHaveScreenshot('histogram-main.png');
    } else {
      // Take a screenshot of the entire page to see what's there
      await expect(page).toHaveScreenshot('histogram-page-overview.png');
    }
  });

  test('should render character histogram correctly', async ({ page }) => {
    // Wait for any character selection or filter controls
    const characterControls = page.locator('[data-character], .character-selector, select, button').first();
    if (await characterControls.count() > 0) {
      await expect(page).toHaveScreenshot('histogram-with-character-controls.png');
    }
  });

  test('should render organization histogram correctly', async ({ page }) => {
    // Wait for any organization selection or filter controls
    const orgControls = page.locator('[data-organization], .organization-selector').first();
    if (await orgControls.count() > 0) {
      await expect(page).toHaveScreenshot('histogram-with-organization-controls.png');
    }
  });

  test('should handle interactive states correctly', async ({ page }) => {
    // Test hover states if any interactive elements exist
    const interactiveElements = page.locator('button, select, [role="button"], .clickable, .hoverable');
    const count = await interactiveElements.count();
    
    if (count > 0) {
      const firstElement = interactiveElements.first();
      
      // Test normal state
      await expect(page).toHaveScreenshot('histogram-normal-state.png');
      
      // Test hover state
      await firstElement.hover();
      await page.waitForTimeout(500);
      await expect(page).toHaveScreenshot('histogram-hover-state.png');
      
      // Test focus state
      await firstElement.focus();
      await page.waitForTimeout(500);
      await expect(page).toHaveScreenshot('histogram-focus-state.png');
    }
  });
});