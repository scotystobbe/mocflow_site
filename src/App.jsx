import React from 'react';
import './App.css';
import Icon from '@mdi/react';
import { 
  mdiLinkVariant, 
  mdiSackOutline, 
  mdiFileDocumentOutline, 
  mdiChartBar, 
  mdiFeatureSearchOutline, 
  mdiToyBrickOutline 
} from '@mdi/js';

function App() {
  return (
    <div className="app">
      <header className="header">
        <img 
          src="/assets/mocflow_wordmark.png" 
          alt="MOCFlow" 
          className="wordmark-header"
        />
        <p className="subtitle">
          Build, deconstruct, and<br className="mobile-break" />  rebuild Alternate MOCs with ease!
        </p>
      </header>

      <main className="main-content">
        <div className="content-layout">
          <div className="description-section">
            <h3>Why I Made It</h3>
            <p className="description">
              One of the coolest things about LEGO is that you can take the bricks apart and rebuild them endlessly. 
              Just six of the classic 2x4 LEGO bricks in the same color can be assembled in 915 million unique combinations.
            </p>
            <p className="description">
              If you're like me, and you love building and re-building LEGO sets, but don't quite have the master builder creativity to build 
              from scratch, <strong>Alternate MOCs</strong> are an awesome solution. An Alternate MOC is a custom, 
              fan-designed model built using only the pieces from a single official LEGO set, rearranged into 
              a new creation.
            </p>
            <p className="description">
            As I started building more Alternate MOCs, I noticed an area that could use some help to ease the process of building, deconstructing,
            and rebuilding. When you build the official set first, you will then need to tear it all down in order to build the Alternate MOC.
            If it's a smaller set, this isn't a big deal. You can fairly easily find the pieces you need in a pile of 300 or so LEGO pieces.
            But if you're working with a set of 1,000+ pieces this quickly becomes unmanageable.
            </p>
            <p className="description">
              <strong>MOCFlow</strong> provides tools, structure, and guidance to ease this process, especially for larger sets where managing and finding pieces becomes challenging.
            </p>
          </div>

          <div className="workflow-section">
            <h3>How It Works</h3>
            <div className="workflow-steps">
              <div className="workflow-step">
                <div className="step-number">1</div>
                <p>Build the original set as normal, following the official instructions.</p>
              </div>
              <div className="workflow-step">
                <div className="step-number">2</div>
                <p>Upload the original PDF instructions, available from <strong>LEGO™</strong> or <strong>Rebrickable®</strong>. Then, as you deconstruct, you digitally bag the pieces using reverse instructions with the official parts list overlayed. Filter by type and color with just a few taps.</p>
              </div>
              <div className="workflow-step">
                <div className="step-number">3</div>
                <p>Add your Alternate MOC PDF instructions and build with the integrated instruction viewer, which overlays the parts list and bag assignments, making it easy to find the right part in the right bag.</p>
              </div>
              <div className="workflow-step">
                <div className="step-number">4</div>
                <p>The instruction viewer will track your build progress page by page, enabling quick post-MOC re-bagging with pre-identified parts for each step.</p>
              </div>
            </div>
          </div>
        </div>

        <div className="features-section">
          <h3>Key Features</h3>
          <div className="features-grid">
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiLinkVariant} size={2} />
              </div>
              <p>Rebrickable API integration for accurate parts lists, images, and set information</p>
            </div>
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiSackOutline} size={2} />
              </div>
              <p>Digital bagging system for organized piece management</p>
            </div>
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiFileDocumentOutline} size={2} />
              </div>
              <p>Instruction viewing with overlayed parts lists and bag assignments</p>
            </div>
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiChartBar} size={2} />
              </div>
              <p>Build progress tracking and MOC organization by parent set</p>
            </div>
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiFeatureSearchOutline} size={2} />
              </div>
              <p>Quick filtering by piece type and color</p>
            </div>
            <div className="feature-item">
              <div className="feature-icon">
                <Icon path={mdiToyBrickOutline} size={2} />
              </div>
              <p>Pre-identified parts for faster re-bagging after MOC completion</p>
            </div>
          </div>
        </div>
      </main>

      <footer className="footer">
        <img 
          src="/assets/mocflow_wordmark.png" 
          alt="MOCFlow" 
          className="wordmark"
        />
        <p className="footer-text">
          Created by <strong>Scoty Stobbe</strong>
        </p>
        <p className="footer-text">
          Powered by <strong>Rebrickable®</strong>
        </p>
        <p className="copyright">© 2026 MOCFlow. All rights reserved.</p>
      </footer>
    </div>
  );
}

export default App;
