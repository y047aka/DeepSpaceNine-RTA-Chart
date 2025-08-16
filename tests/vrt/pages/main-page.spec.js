import { test, expect } from '@playwright/test';

test.describe('Main Page Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    // Navigate to the main page
    await page.goto('/');
    
    // Wait for the application to fully load
    await page.waitForLoadState('networkidle');
    
    // Wait for any potential animations to complete
    await page.waitForTimeout(1000);
  });

  test('should render the main page correctly', async ({ page }) => {
    // Take a full page screenshot
    await expect(page).toHaveScreenshot('main-page-full.png', {
      fullPage: true,
    });
  });

  test('should render the header section correctly', async ({ page }) => {
    // Take a screenshot of just the header area
    const header = page.locator('header, .header, h1').first();
    if (await header.count() > 0) {
      await expect(header).toHaveScreenshot('main-page-header.png');
    }
  });

  test('should render the main content area correctly', async ({ page }) => {
    // Take a screenshot of the main content
    const main = page.locator('main, .main-content, .app').first();
    if (await main.count() > 0) {
      await expect(main).toHaveScreenshot('main-page-content.png');
    } else {
      // Fallback to body if no main element is found
      await expect(page.locator('body')).toHaveScreenshot('main-page-content.png');
    }
  });
});