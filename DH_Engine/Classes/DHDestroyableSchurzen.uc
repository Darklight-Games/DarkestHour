//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHDestroyableSchurzen extends DHDestroyableStaticMesh;

var bool bDestroyed;

function float ComputeAngleOfIncidence(vector HitNormal, vector ProjectileDirection)
{
    local vector SkirtNormal;
    local float Dot, AngleOfIncidence;

    SkirtNormal = Normal(HitNormal);
    ProjectileDirection = Normal(ProjectileDirection);

    AngleOfIncidence = Class'UUnits'.static.RadiansToDegrees(Acos(-ProjectileDirection dot SkirtNormal));

    return AngleOfIncidence;
}

simulated function bool ShouldPenetrate(DHAntiVehicleProjectile P, Vector HitLocation, Vector HitNormal, Vector ProjectileDirection)
{
    local bool bPenetrates, bDestroy;
    local float AngleOfIncidence;

    if (P.RoundType == RT_HEAT)
    {
        AngleOfIncidence = ComputeAngleOfIncidence(HitNormal, ProjectileDirection);

        // Always destroy
        bDestroy = true;

        if (AngleOfIncidence < 45)
        {
            bPenetrates = true;
        }
        else
        {
            bPenetrates = false;
        }
    }

    else if (P.RoundType == RT_HE)
    {
        bDestroy = true;

        if (P.ShellDiameter < 8.5)
        {
            bPenetrates = false;
        }
        else
        {
            bPenetrates = true;
        }
    }

    else if (P.RoundType == RT_APBULLET)
    {
        bPenetrates = false;

        // Damage reduces health
        //Health -= Damage;

        //if (Health <= 0)
        //{
        //    bDestroy = true;
        //}
    }

    else
    {
        // Default: block but don't destroy
        bPenetrates = true;
        bDestroy = false;
    }

    if (bDestroy && !bDestroyed)
    {
        BreakMe();
        bDestroyed = true;
    }
    return bPenetrates;
}
