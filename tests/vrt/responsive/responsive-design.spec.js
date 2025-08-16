import { test, expect } from '@playwright/test';

test.describe('Responsive Design Visual Tests', () => {
  const viewports = [
    { name: 'mobile', width: 375, height: 667 },
    { name: 'desktop', width: 1280, height: 720 }
  ];

  for (const viewport of viewports) {
    test.describe(`${viewport.name} viewport (${viewport.width}x${viewport.height})`, () => {
      test.beforeEach(async ({ page }) => {
        // Set viewport size
        await page.setViewportSize({ width: viewport.width, height: viewport.height });

        await page.goto('/');
        await page.waitForLoadState('networkidle');
        await page.waitForTimeout(2000);
      });

      test(`should render correctly on ${viewport.name}`, async ({ page }) => {
        // Full page screenshot for this viewport
        await expect(page).toHaveScreenshot(`${viewport.name}-full-page.png`, {
          fullPage: true,
        });
      });

      test(`should render header correctly on ${viewport.name}`, async ({ page }) => {
        const header = page.locator('header, .header, h1').first();
        if (await header.count() > 0) {
          await expect(header).toHaveScreenshot(`${viewport.name}-header.png`);
        }
      });

      test(`should render main content correctly on ${viewport.name}`, async ({ page }) => {
        const main = page.locator('main, .main-content, .app').first();
        if (await main.count() > 0) {
          await expect(main).toHaveScreenshot(`${viewport.name}-main-content.png`);
        }
      });

      test(`should render histograms correctly on ${viewport.name}`, async ({ page }) => {
        const histograms = page.locator('svg, canvas, .histogram, .chart');
        const count = await histograms.count();

        if (count > 0) {
          const firstHistogram = histograms.first();
          await expect(firstHistogram).toHaveScreenshot(`${viewport.name}-histogram.png`);
        }
      });

      test(`should render episode table correctly on ${viewport.name}`, async ({ page }) => {
        const episodeTable = page.locator('table, .episode-table, .episode-list');
        const count = await episodeTable.count();

        if (count > 0) {
          const firstTable = episodeTable.first();
          await expect(firstTable).toHaveScreenshot(`${viewport.name}-episode-table.png`);
        }
      });
    });
  }

  test.describe('Responsive Breakpoints', () => {
    test('should handle viewport transitions correctly', async ({ page }) => {
      await page.goto('/');
      await page.waitForLoadState('networkidle');

      // Test transition from desktop to mobile
      await page.setViewportSize({ width: 1280, height: 720 });
      await page.waitForTimeout(1000);
      await expect(page).toHaveScreenshot('transition-desktop.png');

      await page.setViewportSize({ width: 768, height: 1024 });
      await page.waitForTimeout(1000);
      await expect(page).toHaveScreenshot('transition-tablet.png');

      await page.setViewportSize({ width: 375, height: 667 });
      await page.waitForTimeout(1000);
      await expect(page).toHaveScreenshot('transition-mobile.png');
    });
  });

  test.describe('Orientation Tests', () => {
    test('should render correctly in landscape orientation', async ({ page }) => {
      await page.setViewportSize({ width: 667, height: 375 }); // Mobile landscape
      await page.goto('/');
      await page.waitForLoadState('networkidle');
      await page.waitForTimeout(2000);

      await expect(page).toHaveScreenshot('mobile-landscape.png', {
        fullPage: true,
      });
    });

    test('should render correctly in portrait orientation', async ({ page }) => {
      await page.setViewportSize({ width: 375, height: 667 }); // Mobile portrait
      await page.goto('/');
      await page.waitForLoadState('networkidle');
      await page.waitForTimeout(2000);

      await expect(page).toHaveScreenshot('mobile-portrait.png', {
        fullPage: true,
      });
    });
  });
});
