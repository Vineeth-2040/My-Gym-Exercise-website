const cycleGrid = document.getElementById("cycleGrid");

const cycle1 = `
  <article class="cycle-card">
    <h2>Cycle 1</h2>
    <p class="cycle-note">Days 1-3</p>

    <div class="day-list">
      <section class="day-card">
        <h3>Day 1: Push</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>chest machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>lateral raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>overhead dumbell extension</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>chest dips</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 2: Pull</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>chest machine opposite</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>lat pull down</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>dumbell curl</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>biceps machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 3: Leg+Core</h3>

        <div class="exercise-list">
          <div class="exercise-card">
            <h4>Back squats</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Leg press</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Lying leg curl</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Calf raises</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Decline situps</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Hanging leg raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Russian-twist</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Plank-hold</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 30</p></div>
            </div>
          </div>

        </div>
      </section>
    </div>
  </article>
`;

const cycle2 = `
  <article class="cycle-card">
    <h2>Cycle 2</h2>
    <p class="cycle-note">Days 4-6</p>

    <div class="day-list">
      <section class="day-card">
        <h3>Day 1: Push</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>inclined press</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>barbell standing raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>cabel push down</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>push ups</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 2: Pull</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>roman deadlift</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>cabel curl</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>lower back machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>inclined dumbell curl</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 3:Pure core</h3>
        <div class="exercise-list">

          <div class="exercise-card">
            <h4>Cable crunch</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Side plank hip dip</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Ab wheel rollout </h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Bicycle crunches </h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 20</p></div>
            </div>
          </div>


          <div class="exercise-card">
            <h4> lying leg raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 20</p></div>
            </div>
          </div>

        </div>
      </section>
    </div>
  </article>
`;

const cycle3 = `
  <article class="cycle-card">
    <h2>Cycle 3</h2>
    <p class="cycle-note">Days 7-9</p>

    <div class="day-list">
      <section class="day-card">
        <h3>Day 1: Push</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>skull crusher</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>dumbell bench press</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>front raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>inclined supported row</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 2: Pull</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>pull ups</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>T-row</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>bicep machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>forarms curls</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
        </div>
      </section>

<section class="day-card">
        <h3>Day 3: Leg/Core</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>leg press</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>romanian deadlift</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>lateral lunge</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>calf raises</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 15</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Weighted crunch</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Lying leg raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 40s</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Roman chair</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 40s</p></div>
            </div>
          </div>

          <div class="exercise-card">
            <h4>Side plank hip dip </h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 40s</p></div>
            </div>
          </div>

        </div>
      </section>
    </div>
  </article>
`;

const cycle4 = `
  <article class="cycle-card">
    <h2>Cycle 4</h2>
    <p class="cycle-note">Days 10-12</p>

    <div class="day-list">
      <section class="day-card">
        <h3>Day 1: Push</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>triceps bench dips</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 6</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>Lateral raises</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>chest machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>eated dumbell press</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 2: Pull</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>lower back machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 4</p></div>
              <div class="exercise-reps"><p>Reps: 8</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>bicep machine</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>roman Dead lift</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>cabel curls</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
        </div>
      </section>

      <section class="day-card">
        <h3>Day 3: Core</h3>
        <div class="exercise-list">
          <div class="exercise-card">
            <h4>hanging leg raise</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>russian twist weighted</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 12</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>ab wheel rollout</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 10</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>bicycle crunches</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 20</p></div>
            </div>
          </div>
          <div class="exercise-card">
            <h4>plank hold</h4>
            <div class="exercise-meta">
              <div class="exercise-sets"><p>Sets: 3</p></div>
              <div class="exercise-reps"><p>Reps: 45s</p></div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </article>
`;

cycleGrid.innerHTML = cycle1 + cycle2 + cycle3 + cycle4;

makeCollapsibleCards(".cycle-card", "h2, .cycle-note", ".day-list", "cycle-card-header");
makeCollapsibleCards(".day-card", "h3", ".exercise-list", "day-card-header");

function makeCollapsibleCards(cardSelector, titleSelector, contentSelector, headerClass) {
  const cards = document.querySelectorAll(cardSelector);

  cards.forEach((card, index) => {
    const content = card.querySelector(contentSelector);
    const titleItems = card.querySelectorAll(titleSelector);

    if (!content || titleItems.length === 0) {
      return;
    }

    const header = document.createElement("div");
    header.className = headerClass;

    const titleGroup = document.createElement("div");
    titleGroup.className = "collapsible-title-group";

    titleItems.forEach((item) => {
      titleGroup.appendChild(item);
    });

    const button = document.createElement("button");
    button.type = "button";
    button.className = "toggle-button";
    button.setAttribute("aria-expanded", "true");
    button.setAttribute("aria-label", "Toggle section");
    button.innerHTML = '<span class="toggle-arrow">&#9662;</span>';

    content.classList.add("collapsible-content");
    content.id = `${cardSelector.replace(/[^a-z]/gi, "")}-${index}`;
    button.setAttribute("aria-controls", content.id);

    header.appendChild(titleGroup);
    header.appendChild(button);
    card.insertBefore(header, card.firstChild);

    content.style.maxHeight = `${content.scrollHeight}px`;

    button.addEventListener("click", () => {
      const isCollapsed = content.classList.toggle("collapsed");
      button.classList.toggle("collapsed", isCollapsed);
      button.setAttribute("aria-expanded", String(!isCollapsed));
      content.style.maxHeight = isCollapsed ? "0px" : `${content.scrollHeight}px`;

      requestAnimationFrame(() => {
        refreshAllOpenHeights();
      });
    });

    content.addEventListener("transitionend", (event) => {
      if (event.propertyName === "max-height") {
        refreshAllOpenHeights();
      }
    });
  });
}

function refreshAllOpenHeights() {
  const openSections = Array.from(
    document.querySelectorAll(".collapsible-content:not(.collapsed)")
  );

  openSections
    .sort((firstSection, secondSection) => {
      return getCollapsibleDepth(secondSection) - getCollapsibleDepth(firstSection);
    })
    .forEach((section) => {
      section.style.maxHeight = `${section.scrollHeight}px`;
    });
}

function getCollapsibleDepth(element) {
  let depth = 0;
  let currentParent = element.parentElement.closest(".collapsible-content");

  while (currentParent) {
    depth += 1;
    currentParent = currentParent.parentElement.closest(".collapsible-content");
  }

  return depth;
}

window.addEventListener("resize", () => {
  refreshAllOpenHeights();
});
