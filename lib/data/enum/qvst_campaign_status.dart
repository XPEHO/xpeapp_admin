enum QvstCampaignStatusEnum {
  draft(draftCampaignStatus),
  open(openCampaignStatus),
  closed(closedCampaignStatus),
  archived(archivedCampaignStatus);

  final String name;

  const QvstCampaignStatusEnum(this.name);
}

const draftCampaignStatus = "DRAFT";
const openCampaignStatus = "OPEN";
const closedCampaignStatus = "CLOSED";
const archivedCampaignStatus = "ARCHIVED";
